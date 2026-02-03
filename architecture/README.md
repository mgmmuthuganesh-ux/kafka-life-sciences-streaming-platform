# Architecture – Kafka Life Sciences Streaming Platform

## Business Context
Life sciences and pharmaceutical companies require real-time visibility into:
- SAP order processing
- Manufacturing shop-floor events
- Laboratory (LIMS) results
- Compliance and audit data

Traditional batch systems cause delays, compliance risks, and slow incident response.

---

## High-Level Architecture

![Architecture Diagram](Kafka%20Life%20Sciences%20Streaming%20Platform.png)


---

## Architecture Flow

1. **MySQL (SAP / Manufacturing DB)**
   - Source of transactional business data
   - Binlog enabled for CDC

2. **Debezium MySQL Connector**
   - Captures row-level changes
   - Emits insert/update/delete events to Kafka

3. **Apache Kafka**
   - Central event backbone
   - Decouples producers and consumers
   - Enables replay and fault tolerance

4. **ksqlDB**
   - Real-time stream processing
   - Cleans CDC payloads
   - Creates business-friendly streams and aggregations

5. **Kafka Connect (Sinks)**
   - Amazon S3 for analytics and compliance
   - (Optional) Snowflake / Data Warehouse

6. **Monitoring**
   - Kafka metrics exposed
   - Grafana dashboards for visibility

---

## Why This Architecture Works

- Scalable and cloud-ready
- Zero impact on source databases
- Supports real-time analytics and auditing
- Common pattern used in enterprise Kafka platforms

---

## Target Users
- Pharma companies
- Life sciences manufacturing
- Data engineering teams
- Compliance & reporting teams

