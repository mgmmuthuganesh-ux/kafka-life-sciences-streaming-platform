ߧ Industry: Life Sciences / Pharma

Problem Statement

A pharmaceutical company needs a real-time event streaming platform to monitor:

SAP order processing

Laboratory test results (WFX / LIMS)

Manufacturing shop-floor machine events

Live screening systems

Batch systems cause:

Delayed visibility

Compliance risks

Slow incident response

Solution

Design a real-time Kafka-based streaming platform that:

Captures database changes using CDC

Processes events in real time

Stores data for analytics & compliance

Provides monitoring and alerting
ߑ T
3️⃣ High-Level Architecture (Core of Your Portfolio)
Architecture Flow (Explain Like This)


MySQL (SAP / Lab / Shopfloor)
        ↓  CDC (Debezium)
Kafka Connect (Source)
        ↓
Confluent Cloud Kafka Topics
        ↓
KSQLDB (stream processing)
        ↓
Kafka Connect (Sinks)
   → Amazon S3
   → Snowflake
        ↓
Grafana Monitoring
