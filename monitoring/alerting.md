# Alerting Strategy

## Critical Alerts
- Kafka broker down
- Connector FAILED state
- Consumer lag exceeding threshold

## Warning Alerts
- Increased processing latency
- CDC throughput drop
- Sink connector retries

## Example Alert Rules
- Consumer lag > 5 minutes
- Connector task FAILED for > 2 minutes
- No CDC events for 10 minutes

## Alert Channels
- Email
- Slack
- PagerDuty (enterprise environments)
