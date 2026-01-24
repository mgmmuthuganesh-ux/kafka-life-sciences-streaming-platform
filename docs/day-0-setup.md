Platform Setup

## Docker Setup
```bash
docker compose up -d
docker ps

Services Started
Zookeeper
Kafka
MySQL (CDC enabled)
Kafka Connect (Debezium)
curl http://localhost:8083/

💼 Shows **environment readiness**

---

## 📄 `docs/day-1-mysql-cdc.md`  
**MySQL + CDC Foundation**

Add:

```md
# Day 1 – MySQL CDC Setup

## MySQL Configuration
CDC requires binlog enabled:

```sql
SHOW VARIABLES LIKE 'binlog_format';

Expected:
binlog_format = ROW
log_bin = ONARIABLES LIKE 'log_bin';


Schema creation CREATE DATABASE sap;
USE sap;

CREATE TABLE material_orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  material_code VARCHAR(50),
  plant VARCHAR(50),
  quantity INT,
  order_status VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO material_orders
(material_code, plant, quantity, order_status)
VALUES ('MAT-10001', 'BERLIN-PLANT', 1800, 'CREATED');


💼 Shows **CDC understanding (not just Kafka)**

---

## 📄 `docs/day-2-debezium.md`  
🔥 **MOST IMPORTANT FILE FOR KAFKA JOBS**

Add:

```md
# Day 2 – Debezium MySQL CDC

## Connector Creation
```bash
curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  --data @kafka-connect/mysql-sap-cdc.json

connector/status

curl http://localhost:8083/connectors/mysql-sap-cdc-connector/status

CDC TOPIC Verification

docker exec -it kafka kafka-console-consumer  --bootstrap-server kafka:29092  --topic sap.sap.material_orders  --from-beginning


💼 This alone can pass **Kafka CDC interviews**

---

## 📄 `docs/troubleshooting.md`  
🔥 **This makes you look SENIOR**

Add things you already faced:

```md
# Troubleshooting

## Kafka Connect not reachable
Cause:
- Wrong advertised listeners

Fix:
- Set CONNECT_REST_LISTENERS=0.0.0.0:8083

## Debezium error: binlog_format not ROW
Fix:
- Enable binlog in MySQL startup

## Git non-fast-forward error
Fix:
```bash
git pull --rebase
# Interview Notes

## Why Debezium CDC?
- Low-latency
- Exactly-once semantics
- Schema evolution

## Why Kafka for Life Sciences?
- Auditability
- Compliance
- Real-time visibility

## Common Questions
Q: What happens on restart?
A: Offset stored in Kafka, resumes safely.




