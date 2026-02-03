# CI/CD – Kafka Streaming Platform

## Purpose
This CI/CD pipeline validates Kafka streaming configurations before deployment.

In real enterprise environments, Kafka changes must be reviewed and validated to avoid:
- Broken connectors
- Schema incompatibilities
- Production outages

This pipeline demonstrates production-grade validation practices.

## Pipeline Responsibilities

### 1. Code Validation
- Validates repository structure
- Ensures required folders exist

### 2. Docker Compose Validation
- Lints docker-compose.yml
- Prevents invalid Kafka configurations

### 3. Kafka Connect Validation
- Validates Debezium connector JSON
- Ensures required fields exist

### 4. Safe by Design
- No infrastructure creation
- No cluster access required
- Suitable for regulated enterprise environments

## Tools Used
- GitHub Actions
- Docker CLI
- jq (JSON validation)

## When It Runs
- On every pull request
- On every push to main
