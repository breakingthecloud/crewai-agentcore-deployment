# 🚀 Deploying CrewAI Multi-Agent Teams with Amazon Bedrock AgentCore

> From local development to production-ready serverless deployment — no infrastructure management required.

## What's This About?

This repo contains the complete, validated code from **[Blog #8: Deploying CrewAI Multi-Agent Teams with Amazon Bedrock AgentCore](https://breakingthecloud.com)**. It demonstrates how to take a CrewAI multi-agent system and deploy it to production using Amazon Bedrock AgentCore's serverless runtime.

**The core idea:** You build your AI agents locally with CrewAI, wrap them with a single `@app.entrypoint` decorator, and AgentCore handles the rest — scaling, security, session isolation, and observability.

## 🎯 What You'll Learn

- **CrewAI Multi-Agent Setup** — Research, Analysis, and Writing agents collaborating on tasks
- **Bedrock Integration** — Using Claude models through CrewAI's LLM wrapper
- **AgentCore Deployment** — The full `create → dev → deploy → invoke` workflow
- **Production Patterns** — Error handling, rate limiting, and real-world deployment considerations

## 📁 Repo Structure

```
├── bedrock-agentcore-crewai-validation.ipynb  # 📓 Full walkthrough notebook (start here)
├── crewai_agent.py                            # Standalone CrewAI agent for local testing
├── setup_env.sh                               # Environment setup script
├── pyproject.toml                             # Python dependencies
└── CrewAIAgent/                               # AgentCore project (generated + customized)
    ├── agentcore/                             # Infrastructure config & CDK
    └── app/CrewAIAgent/                       # Production agent code
        ├── main.py                            # Entry point with @app.entrypoint
        └── pyproject.toml                     # Agent dependencies
```

## ⚡ Quick Start

```bash
# 1. Clone and setup
git clone https://github.com/breakingthecloud/crewai-agentcore-deployment.git
cd crewai-agentcore-deployment
chmod +x setup_env.sh && ./setup_env.sh

# 2. Open the notebook
jupyter lab bedrock-agentcore-crewai-validation.ipynb
```

## 📋 Prerequisites

- AWS account with Bedrock model access enabled (Claude Sonnet)
- Python 3.10+
- Node.js 20+ (for AgentCore CLI)
- AWS credentials configured

## 🔑 Key Takeaway

AgentCore is **framework-agnostic** — it works with CrewAI, LangGraph, Strands Agents, Google ADK, OpenAI Agents, or any custom framework. The deployment pattern is always the same: wrap your agent logic with `BedrockAgentCoreApp` and let AWS handle production infrastructure.

---

📝 **Blog post:** [breakingthecloud.com](https://breakingthecloud.com)
