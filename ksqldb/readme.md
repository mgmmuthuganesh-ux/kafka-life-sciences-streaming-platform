# ksqlDB – Real-Time Stream Processing

## Purpose
This module transforms raw CDC events from Kafka into
business-ready streams and real-time analytics.

It demonstrates how event-driven platforms enable:
- Real-time visibility
- Operational dashboards
- Alerts and monitoring
- Analytics-ready datasets

---

## Input
- Kafka Topic: sap.sap.material_orders
- Source: Debezium MySQL CDC

---

## Output
- Clean business event streams
- Real-time aggregations
- Alert streams for high-impact events

---

## Key Concepts Used
- STREAM vs TABLE
- CDC envelope handling
- Real-time aggregations
- Continuous queries (EMIT CHANGES)

---

## Execution Order
1. streams.sql
2. aggregations.sql
3. alerts.sql
