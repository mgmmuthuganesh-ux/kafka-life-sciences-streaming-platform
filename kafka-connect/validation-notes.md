# CDC Validation & Troubleshooting

## Common Issues

### 1. No Events in Kafka
- Check binlog enabled
- Verify table exists
- Ensure snapshot.mode is not disabled

### 2. LEADER_NOT_AVAILABLE
- Kafka broker not ready
- Topic auto-creation delay

### 3. Schema History Errors
- schema-changes topic missing
- Kafka bootstrap server misconfigured

### 4. Empty ksqlDB Streams
- CDC envelope structure mismatch
- Incorrect field path (AFTER vs payload.after)

---

## Validation Checklist
- Connector state = RUNNING
- Task state = RUNNING
- Topics visible in Kafka
- Data visible via console consumer
