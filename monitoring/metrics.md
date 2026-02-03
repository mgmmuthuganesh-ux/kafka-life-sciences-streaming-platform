# Kafka Metrics to Monitor

## Kafka Broker Metrics
- UnderReplicatedPartitions
- OfflinePartitionsCount
- RequestHandlerAvgIdlePercent
- MessagesInPerSec

## Kafka Consumer Metrics
- Consumer Lag
- RecordsConsumedRate
- CommitLatencyAvg

## Kafka Connect Metrics
- connector-status (RUNNING / FAILED)
- task-error-total
- source-record-poll-rate
- sink-record-send-rate

## ksqlDB Metrics
- Query processing rate
- Query lag
- Failed queries

---

## Why These Metrics Matter
- Lag indicates downstream issues
- Broker metrics show cluster health
- Connector metrics detect CDC failures
- ksqlDB metrics ensure real-time SLAs
