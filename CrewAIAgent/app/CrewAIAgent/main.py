from bedrock_agentcore.runtime import BedrockAgentCoreApp
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = BedrockAgentCoreApp()


@app.entrypoint
def crewai_handler(payload, context):
    """Main AgentCore entrypoint - lazy imports to avoid cold start timeout."""
    try:
        from crewai import Agent, Crew, Process, Task, LLM
        from crewai.tools import BaseTool

        class KnowledgeSearchTool(BaseTool):
            name: str = "knowledge_search"
            description: str = "Search AWS documentation and technical knowledge"
            def _run(self, query: str) -> str:
                kb = {
                    "s3": "Object storage with 99.999999999% durability",
                    "lambda": "Serverless compute with automatic scaling",
                    "agentcore": "Secure serverless runtime for AI agents",
                }
                results = [
                    f"{k.upper()}: {v}"
                    for k, v in kb.items()
                    if any(w.lower() in v.lower() for w in query.split())
                ]
                return "\n".join(results) or "No results found"

        user_input = payload.get("prompt", "How can I help you?")
        logger.info(f"Processing: {user_input}")

        llm = LLM(model="bedrock/us.anthropic.claude-haiku-4-5-20251001-v1:0", temperature=0.1)

        researcher = Agent(
            role="AWS Research Specialist",
            goal="Find comprehensive AWS service information",
            backstory="Expert researcher with deep AWS knowledge",
            tools=[KnowledgeSearchTool()],
            llm=llm,
            verbose=False,
        )

        research_task = Task(
            description=f"Research: {user_input}",
            agent=researcher,
            expected_output="Research findings",
        )

        crew = Crew(
            agents=[researcher],
            tasks=[research_task],
            process=Process.sequential,
            verbose=False,
        )

        result = crew.kickoff()
        return {
            "result": result.raw,
            "status": "success",
            "session_id": context.session_id,
        }
    except Exception as e:
        logger.error(f"Error: {str(e)}")
        return {"result": f"Error: {str(e)}", "status": "error"}


if __name__ == "__main__":
    app.run()
