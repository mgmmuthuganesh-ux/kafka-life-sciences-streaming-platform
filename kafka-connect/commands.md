# Kafka Connect – Operational Commands

## Register Connector

curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  --data @mysql-sap-cdc.json
  
## List Connectors

curl http://localhost:8083/connectors

## Check Connector Status
curl http://localhost:8083/connectors/mysql-sap-cdc-connector/status

## Restart Connector
curl -X POST \
  http://localhost:8083/connectors/mysql-sap-cdc-connector/restart

## Delete Connector
curl -X DELETE \
  http://localhost:8083/connectors/mysql-sap-cdc-connector

## Consume CDC Events
docker exec -it kafka kafka-console-consumer \
  --bootstrap-server kafka:29092 \
  --topic sap.sap.material_orders \
  --from-beginning

