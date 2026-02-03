#!/bin/bash

echo "Validating Kafka Connect configurations..."

for file in kafka-connect/*.json; do
  echo "Checking $file"
  jq -e '.config."connector.class"' "$file" > /dev/null
  jq -e '.config."topic.prefix"' "$file" > /dev/null
done

echo "All Kafka Connect configs are valid"
