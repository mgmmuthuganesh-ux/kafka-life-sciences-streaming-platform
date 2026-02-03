# Kafka Connect – Operational Commands

## Register Connector
```bash
curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  --data @mysql-sap-cdc.json
