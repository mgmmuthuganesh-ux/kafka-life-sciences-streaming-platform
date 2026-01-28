
# Kafka Life Sciences Streaming Platform

Industry: Life Sciences / Pharma


This repository demonstrates how I design and implement
**production-ready, event-driven data platforms** using Apache Kafka
for **Life Sciences / Pharma** use cases.

It showcases:
- Real-time CDC from MySQL (SAP-style systems)
- Stream processing using ksqlDB
- Scalable Kafka Connect pipelines
- Monitoring-ready architecture
- Cloud-ready design (AWS / Snowflake / S3)

This is the same architecture I deliver for:
✔ Freelance clients  
✔ Pharma & life-sciences companies  
✔ Kafka modernization projects 


## Overview
This project demonstrates a real-time data streaming platform using Apache Kafka and Debezium CDC.



This repository showcases a **real-time event streaming platform** designed for life sciences and pharmaceutical enterprises.  
The platform enables **low-latency visibility**, **regulatory compliance**, and **operational monitoring** by streaming data changes from core enterprise systems using Apache Kafka.

The implementation follows **production-grade architecture patterns** commonly used in pharma manufacturing, labs, and supply chain systems.



## Business Problem

Pharmaceutical enterprises rely on batch-oriented systems such as:

- SAP (order & material management)
- LIMS / WFX (laboratory test results)
- Manufacturing shop-floor systems
- Batch and screening systems

These batch systems cause:

- Delayed visibility into critical events
- Compliance and audit risks
- Slow incident detection and response
- Inability to react in real time

 
## Solution

This project demonstrates a **Kafka-based real-time streaming platform** that:

- Captures database changes using **CDC (Debezium)**
- Streams events in real time using **Apache Kafka**
- Performs real-time processing using **Kafka Streams and ksqlDB**
- Delivers data to analytics and storage systems
- Provides observability and monitoring


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
↓




## Technology Stack

- **Apache Kafka** (open-source, Confluent-compatible)
- **Kafka Connect**
  - Debezium MySQL Source
  - S3 Sink
  - Snowflake Sink
- **ksqlDB**
- **Kafka Streams**
- **MySQL** (CDC source systems)
- **Docker & Docker Compose**
- **Grafana & Prometheus**
- **GitHub Actions (CI/CD)**


## Project Structure

├── docker-compose.yml # Kafka, Zookeeper, MySQL
├── mysql/ # SAP / LIMS / WMS schemas
├── kafka-connect/ # Source & sink connector configs
├── ksqldb/ # Stream processing & aggregations
├── monitoring/ # Grafana dashboards
├── architecture/ # Architecture diagrams
├── ci-cd/ # GitHub Actions pipelines
└── README.md



## Setup & Execution

The platform is designed to be **run locally using Docker**, enabling fast iteration and CDC validation without cloud dependencies.

Steps include:
1. Start Kafka, Zookeeper, and MySQL using Docker Compose
2. Enable CDC on MySQL using ROW-based binlogs
3. Deploy Debezium MySQL source connector
4. Validate real-time events in Kafka topics
5. Process streams using ksqlDB / Kafka Streams

(Detailed steps will be added.)



## Monitoring & Observability

- Kafka broker and connector metrics are exposed via Prometheus
- Grafana dashboards provide visibility into:
  - Topic throughput
  - Consumer lag
  - Connector health
  - Error rates



## Key Learnings & Best Practices

- CDC requires strict database configuration (ROW binlogs)
- Infrastructure stability must be validated before stream processing
- Schema evolution and error handling are critical in regulated domains
- Monitoring is as important as data movement in production systems



## Ownership & Responsibilities

This project was designed and implemented end-to-end, including:

- Architecture design
- Kafka & CDC configuration
- Stream processing logic
- Observability and monitoring setup
- CI/CD automation



## Use Cases

- Real-time SAP order monitoring
- Lab result streaming and validation
- Manufacturing event tracking
- Compliance and audit pipelines
- Operational alerting
