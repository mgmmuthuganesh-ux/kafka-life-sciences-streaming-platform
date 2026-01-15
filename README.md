ߧ Industry: Life Sciences / Pharma
# Kafka Life Sciences Streaming Platform

## Overview
This project demonstrates a real-time data streaming platform for life sciences and pharmaceutical companies using Apache Kafka and Confluent Cloud.

## Business Use Case
Pharma enterprises require real-time visibility into SAP orders, lab results, and manufacturing shop-floor events. This platform streams database changes and events in real time to enable faster decision-making, monitoring, and compliance.

## Architecture
The platform uses CDC-based ingestion, Kafka stream processing, and cloud-native sinks for analytics and storage.

## Tech Stack
- Apache Kafka (Confluent Cloud)
- Kafka Connect (Debezium, S3, Snowflake)
- KSQLDB
- AWS (RDS, S3)
- Docker & GitHub Actions
- Grafana

## Data Flow
1. MySQL databases generate CDC events
2. Kafka Connect ingests changes into Kafka topics
3. KSQLDB processes and aggregates streams
4. Data is delivered to S3 and Snowflake
5. Grafana monitors topics and connectors

## Project Structure
(Explain folders here)

## Setup & Execution
(To be added)

## Monitoring
(To be added)

## Screenshots
(To be added)

## Learnings & Best Practices
(To be added)

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
