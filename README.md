# N8N Project - Kruu

## Initial Setup

1. Copy the environment template:

   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and set your encryption key:

   ```bash
   # Generate a random key
   openssl rand -hex 32
   # Then paste it in .env as N8N_ENCRYPTION_KEY
   ```

## Local Development

1. Start n8n:

   ```bash
   docker compose -f compose.dev.yaml up -d
   ```

2. Expose via cloudflared tunnel:

   ```bash
   cloudflared tunnel run --url http://localhost:5678 kruu-workflow
   ```

3. Access n8n at: <http://localhost:5678>

## Production Setup

1. Copy and edit `.env` with production values:

   ```bash
   cp .env.example .env
   # Edit .env with production encryption key, webhook URL, and auth credentials
   ```

2. Start with production config:

   ```bash
   docker compose -f compose.prod.yaml up -d
   ```

## Maintenance

### Update n8n

1. Pull latest image:

   ```bash
   docker compose down
   docker pull n8nio/n8n:latest
   docker compose up -d
   ```

### Rebuild container

```bash
docker compose down && docker compose up -d
```

### Access container shell

```bash
docker exec -it kruu_n8n sh
```

### Save files locally with "Read/Write Files from Disk" node

Files are saved to: `/n8n-files/`

### Export all workflows

```bash
docker exec -u node -it kruu_n8n n8n export:workflow --all --output=/files/workflows.json
```
