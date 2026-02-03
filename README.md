# Kafka Life Sciences Streaming Platform

**Industry:** Life Sciences / Pharma  

This repository demonstrates how I design and implement **production-ready,
event-driven data platforms** using **Apache Kafka** for
**Life Sciences and Pharmaceutical enterprises**.

The architecture and implementation patterns shown here are the same ones I use for:
- ✔ Freelance Kafka consulting projects
- ✔ Pharma & life-sciences enterprises
- ✔ Kafka modernization and CDC initiatives

---

## Overview

This project showcases a **real-time event streaming platform** designed for
regulated life-sciences environments.

It enables:
- Low-latency operational visibility
- CDC-based data ingestion
- Real-time analytics and alerts
- Audit-friendly and compliance-ready pipelines

The solution follows **production-grade Kafka architecture patterns**
commonly used in pharma manufacturing, laboratories, and supply-chain systems.

---

## Business Problem

Pharmaceutical enterprises rely heavily on **batch-oriented systems** such as:

- SAP (order & material management)
- LIMS / WFX (laboratory systems)
- Manufacturing shop-floor systems
- Batch and screening platforms

Batch processing leads to:
- Delayed visibility into critical events
- Compliance and audit risks
- Slow incident detection and response
- Limited real-time decision-making

---

## Solution

This project demonstrates a **Kafka-based real-time streaming platform** that:

- Captures database changes using **CDC (Debezium)**
- Streams events in real time via **Apache Kafka**
- Performs stream processing using **ksqlDB**
- Delivers data to analytics and storage systems
- Provides observability and operational monitoring

---

## High-Level Architecture

MySQL (SAP / Lab / Shopfloor)
↓ CDC (Debezium)
Kafka Connect (Source)
↓
Kafka Topics
↓
ksqlDB / Kafka Streams
↓
Kafka Connect (Sinks)
→ Amazon S3
→ Snowflake


Detailed architecture documentation:
👉 `architecture/README.md`

---

## Technology Stack

- **Apache Kafka** (open-source, Confluent-compatible)
- **Kafka Connect**
  - Debezium MySQL Source
  - Amazon S3 Sink
  - Snowflake Sink
- **ksqlDB**
- **MySQL** (CDC source systems)
- **Docker & Docker Compose**
- **Grafana & Prometheus**
- **GitHub Actions (CI/CD)**

---

## Project Structure

├── docker-compose.yml # Kafka, Zookeeper, MySQL


├── mysql/ # SAP-style schemas & CDC setup


├── kafka-connect/ # Source & sink connector configs


├── ksqldb/ # Stream processing & aggregations


├── monitoring/ # Observability & alerting strategy


├── architecture/ # Architecture diagrams & explanation


├── ci-cd/ # GitHub Actions pipelines


└── README.md


---

## Setup & Execution

The platform is designed to **run locally using Docker**, allowing fast
iteration and CDC validation without cloud dependencies.

High-level steps:
1. Start Kafka, Zookeeper, and MySQL via Docker Compose
2. Enable CDC using ROW-based MySQL binlogs
3. Deploy Debezium MySQL source connector
4. Validate real-time events in Kafka topics
5. Process streams using ksqlDB

👉 Detailed steps are documented inside each module folder.

---

## Stream Processing (ksqlDB)

ksqlDB is used to:
- Flatten Debezium CDC envelopes
- Create business-ready Kafka streams
- Perform real-time aggregations
- Detect anomalies and trigger alerts

---

## Monitoring & Observability

The platform includes a **production-grade monitoring strategy** covering:
- Kafka brokers
- CDC pipelines
- Stream processing
- Analytics delivery

Key capabilities:
- Prometheus-based metrics collection
- Grafana dashboards for:
  - Topic throughput
  - Consumer lag
  - Connector health
  - Error rates

---

## Key Learnings & Best Practices

- CDC requires strict database configuration (ROW-based binlogs)
- Schema handling is critical in regulated environments
- Monitoring is as important as data movement
- Kafka platforms must be designed for failure and recovery

---

## Ownership & Responsibilities

This project was designed and implemented **end-to-end**, including:

- Architecture design
- Kafka & CDC configuration
- Stream processing logic
- Observability and monitoring strategy
- CI/CD validation pipelines

---

## Use Cases

- Real-time SAP order monitoring
- Lab result streaming & validation
- Manufacturing event tracking
- Compliance and audit pipelines
- Operational alerting

---

## CI/CD

The repository includes a **GitHub Actions pipeline** that validates:
- Docker Compose configuration
- Kafka Connect connector definitions
- Project structure consistency

This mirrors enterprise Kafka delivery practices.
