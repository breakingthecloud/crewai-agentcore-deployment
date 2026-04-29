#!/bin/bash
# Setup CrewAI + AgentCore Environment for blog 8_2_new
# Usage: cd 8_2_new && ./setup_env.sh

set -e

VENV_NAME="crewai-agentcore-env"
KERNEL_NAME="crewai-agentcore"
KERNEL_DISPLAY="CrewAI AgentCore (3.13)"

echo "🚀 Setting up CrewAI + AgentCore Environment..."

# Check uv
if ! command -v uv &> /dev/null; then
    echo "❌ uv not found. Install with: curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# Remove existing environment if it exists
if [ -d "$VENV_NAME" ]; then
    echo "🗑️ Removing existing $VENV_NAME..."
    rm -rf "$VENV_NAME"
fi

# Create virtual environment
echo "📦 Creating virtual environment with Python 3.13..."
uv venv "$VENV_NAME" --python 3.13

# Install dependencies
echo "📚 Installing dependencies..."
uv pip install --python "$VENV_NAME/bin/python" \
    boto3 \
    crewai \
    bedrock-agentcore \
    requests \
    ipykernel

# Register Jupyter kernel
echo "📓 Registering Jupyter kernel..."
"$VENV_NAME/bin/python" -m ipykernel install \
    --user \
    --name "$KERNEL_NAME" \
    --display-name "$KERNEL_DISPLAY"

# Verify
echo "✅ Verifying installation..."
"$VENV_NAME/bin/python" -c "
import crewai, boto3
from bedrock_agentcore.runtime import BedrockAgentCoreApp
print(f'  CrewAI: {crewai.__version__}')
print(f'  Boto3:  {boto3.__version__}')
print(f'  AgentCore SDK: OK')
print(f'  Python: {__import__(\"sys\").version.split()[0]}')
"

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📋 Next steps:"
echo "  1. In VS Code: Cmd+Shift+P → 'Developer: Reload Window'"
echo "  2. Open the .ipynb notebook"
echo "  3. Select Kernel → '$KERNEL_DISPLAY'"
echo "  4. Run cells with Shift+Enter"
echo ""
echo "🔄 To activate manually: source $VENV_NAME/bin/activate"
