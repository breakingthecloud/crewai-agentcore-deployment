<p align="center">
  <img alt="CrewAI Agent Core" src="https://img.shields.io/badge/🚀-CrewAI_Agent_Core-FF9900?style=for-the-badge" height="50">
</p>

<p align="center">
  <b>Deploy CrewAI multi-agent teams with Amazon Bedrock Agent Core</b><br>
  Local development → production-ready serverless deployment. No infrastructure management.
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a>
  ·
  <a href="#repo-structure">Structure</a>
  ·
  <a href="#notebook-walkthrough">Walkthrough</a>
  ·
  <a href="#prerequisites">Prerequisites</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-Apache_2.0-FF9900?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=flat-square&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/CrewAI-multi--agent-FF9900?style=flat-square" alt="CrewAI">
  <img src="https://img.shields.io/badge/AWS-Agent_Core-FF9900?style=flat-square&logo=amazonwebservices" alt="Agent Core">
  <img src="https://img.shields.io/badge/blog-breakingthecloud.com-blue?style=flat-square" alt="Blog">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square" alt="PRs">
</p>

---

From local development to production-ready serverless deployment — no infrastructure management required. This repo contains the complete, validated code from **[Blog #8: Deploying CrewAI Multi-Agent Teams with Amazon Bedrock Agent Core](https://breakingthecloud.com)**.

**The core idea:** You build your AI agents locally with CrewAI, wrap them with a single `@app.entrypoint` decorator, and Agent Core handles the rest — scaling, security, session isolation, and observability.

## What You'll Learn

- **CrewAI Multi-Agent Setup** — Research, Analysis, and Writing agents collaborating on tasks
- **Bedrock Integration** — Using Claude models through CrewAI's LLM wrapper
- **Agent Core Deployment** — The full `create → dev → deploy → invoke` workflow
- **Production Patterns** — Error handling, rate limiting, and real-world deployment considerations

## Repo Structure

```
├── bedrock-agentcore-crewai-validation.ipynb  # 📓 Full walkthrough notebook (start here)
├── crewai_agent.py                            # Standalone CrewAI agent for local testing
├── setup_env.sh                               # Environment setup script
├── pyproject.toml                             # Python dependencies
└── CrewAIAgent/                               # Agent Core project (generated + customized)
    ├── agentcore/                             # Infrastructure config & CDK
    └── app/CrewAIAgent/                       # Production agent code
        ├── main.py                            # Entry point with @app.entrypoint
        └── pyproject.toml                     # Agent dependencies
```

## Quick Start

```bash
# 1. Clone and setup
git clone https://github.com/breakingthecloud/crewai-agentcore-deployment.git
cd crewai-agentcore-deployment
chmod +x setup_env.sh && ./setup_env.sh

# 2. Activate virtual environment
source .venv/bin/activate

# 3. Test locally
python crewai_agent.py

# 4. Open the notebook for the full walkthrough
jupyter lab bedrock-agentcore-crewai-validation.ipynb
```

## Notebook Walkthrough

| Section | Description |
|---------|-------------|
| **1. Setup** | Environment configuration and dependency installation |
| **2. Local CrewAI** | Building a multi-agent research team locally |
| **3. Agent Core Project** | Creating and configuring the Agent Core project |
| **4. Local Dev Testing** | Testing the agent with `agent-core dev` |
| **5. Production Deployment** | Deploying with `agent-core deploy` |
| **6. Invocation** | Testing the deployed agent via `agent-core invoke` |
| **7. Production Patterns** | Error handling, rate limits, real-world considerations |

## Prerequisites

- AWS account with Bedrock model access enabled (Claude Sonnet)
- Python 3.10+
- Node.js 20+ (for Agent Core CLI)
- AWS credentials configured (`aws configure` or SSO)

## Key Takeaway

Agent Core is **framework-agnostic** — it works with CrewAI, LangGraph, Strands Agents, Google ADK, OpenAI Agents, or any custom framework. The deployment pattern is always the same: wrap your agent logic with `BedrockAgentCoreApp` and let AWS handle production infrastructure.

---

📝 **Blog post:** [breakingthecloud.com](https://breakingthecloud.com)

## License

Apache 2.0.

---

<p align="center">
  <a href="https://breakingthecloud.com">breakingthecloud.com</a> · <a href="https://cortez.cloud">cortez.cloud</a>
</p>
<p align="center">
  <sub>Build locally. Deploy serverlessly. Scale infinitely.</sub>
</p>
