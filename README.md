# 🚀 Deploying CrewAI Multi-Agent Teams with Amazon Bedrock Agent Core

[![License](https://img.shields.io/badge/license-Apache%202.0-blue)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://python.org)
[![CrewAI](https://img.shields.io/badge/CrewAI-📋-orange)](https://crewai.com)
[![AWS](https://img.shields.io/badge/AWS-Agent%20Core-FF9900)](https://aws.amazon.com/bedrock/agent/)

> From local development to production-ready serverless deployment — no infrastructure management required.

## What's This About?

This repo contains the complete, validated code from **[Blog #8: Deploying CrewAI Multi-Agent Teams with Amazon Bedrock Agent Core](https://breakingthecloud.com)**. It demonstrates how to take a CrewAI multi-agent system and deploy it to production using Amazon Bedrock Agent Core's serverless runtime.

**The core idea:** You build your AI agents locally with CrewAI, wrap them with a single `@app.entrypoint` decorator, and Agent Core handles the rest — scaling, security, session isolation, and observability.

## 🎯 What You'll Learn

- **CrewAI Multi-Agent Setup** — Research, Analysis, and Writing agents collaborating on tasks
- **Bedrock Integration** — Using Claude models through CrewAI's LLM wrapper
- **Agent Core Deployment** — The full `create → dev → deploy → invoke` workflow
- **Production Patterns** — Error handling, rate limiting, and real-world deployment considerations

## 📁 Repo Structure

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

## ⚡ Quick Start

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

## 📋 Prerequisites

- AWS account with Bedrock model access enabled (Claude Sonnet)
- Python 3.10+
- Node.js 20+ (for Agent Core CLI)
- AWS credentials configured (`aws configure` or SSO)

## 🔑 Key Takeaway

Agent Core is **framework-agnostic** — it works with CrewAI, LangGraph, Strands Agents, Google ADK, OpenAI Agents, or any custom framework. The deployment pattern is always the same: wrap your agent logic with `BedrockAgentCoreApp` and let AWS handle production infrastructure.

## Notebook Walkthrough

The Jupyter notebook covers:

| Section | Description |
|---------|-------------|
| **1. Setup** | Environment configuration and dependency installation |
| **2. Local CrewAI** | Building a multi-agent research team locally |
| **3. Agent Core Project** | Creating and configuring the Agent Core project |
| **4. Local Dev Testing** | Testing the agent with `agent-core dev` |
| **5. Production Deployment** | Deploying with `agent-core deploy` |
| **6. Invocation** | Testing the deployed agent via `agent-core invoke` |
| **7. Production Patterns** | Error handling, rate limits, real-world considerations |

---

📝 **Blog post:** [breakingthecloud.com](https://breakingthecloud.com)

## License

Apache 2.0
