# 🚀 Spryker Prompt MCP Server

MCP server for Spryker Prompt Library.

## Installation for local development

> Installation for mcp server developers. \
If you want to use MCP Server as a tool only, use this installation: [GETTING_STARTED.md](../GETTING_STARTED.md)

1. Pull the spryker-dev/prompt-library repository
2. Install [uv](https://docs.astral.sh/uv/#installation).
3. Run `cd /<path to prompt-library dir>/prompt-library`
4. Run `uv venv`
5. Run `uv pip install -e .`
6. Add the following configuration to your `mcpServers`:
```json
{
    "mcpServers": {
        "spryker-prompts": {
            "command": "uv",
            "args": [
                "--directory",
                "/<path to prompt-library dir>/prompt-library",
                "run",
                "prompt-mcp"
            ]
        }
    }
}
```

## Docker Deployment

For production or isolated environments, you can use Docker:

### Quick Start with Docker

```bash
# Build and run with Docker Compose
docker compose up -d

# View logs
docker compose logs -f

# Stop the service
docker compose down
```

### IDE Configuration for Docker

Configure your IDE to use the containerized MCP server:

```json
{
    "mcpServers": {
        "spryker-prompts": {
            "command": "docker",
            "args": [
                "exec",
                "-i",
                "spryker-prompts-mcp",
                "python3",
                "-m",
                "prompt_mcp"
            ]
        }
    }
}
```

See [GETTING_STARTED.md](../GETTING_STARTED.md) for more details.

## Testing

[MCP Inspector](https://modelcontextprotocol.io/legacy/tools/inspector)
