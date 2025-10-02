# Use Python 3.12 slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml ./
COPY MANIFEST.in ./
COPY LICENSE README.md ./
COPY prompt_mcp/ ./prompt_mcp/
COPY prompts/ ./prompts/

# Install dependencies (only mcp is required)
# Use trusted host to bypass SSL issues in build environment
RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org "mcp[cli]>=1.12.0"

# Expose port for MCP server (stdio mode by default)
# Note: MCP typically uses stdio, but we expose a port for future HTTP/WebSocket support
EXPOSE 8080

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Run the MCP server
CMD ["python3", "-m", "prompt_mcp"]
