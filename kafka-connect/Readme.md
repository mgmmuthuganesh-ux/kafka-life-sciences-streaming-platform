# Kafka Connect – MySQL CDC (Debezium)

## Purpose
This module captures real-time database changes from SAP-like MySQL systems
and streams them into Kafka topics using Debezium CDC.

This pattern is commonly used in:
- SAP order processing
- Manufacturing systems
- Life sciences compliance pipelines

---

## Connector Used
- Debezium MySQL Source Connector

---

## Source Database
- MySQL (CDC enabled with binlog)
- Database: sap
- Table: material_orders

---

## Kafka Topics Created

| Topic | Purpose |
|-----|--------|
| sap.sap.material_orders | Raw CDC events |
| schema-changes.sap | Schema evolution tracking |

---

## CDC Event Types
- INSERT → op = "c"
- UPDATE → op = "u"
- DELETE → op = "d"

---

## Why CDC?
- No polling
- Near real-time
- Full audit history
- Regulatory compliance friendly

---

## Production Notes
- Binlog format must be ROW
- server-id must be unique
- Schema history topic must exist
