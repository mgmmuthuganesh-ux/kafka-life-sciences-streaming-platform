# MySQL – SAP-Style Source Database

## Purpose
This module simulates a SAP-like transactional database used in
life sciences and pharmaceutical enterprises.

The database acts as a CDC source for Kafka using Debezium.

---

## Database Details
- Engine: MySQL 8.x
- Database name: sap
- CDC enabled via MySQL binlog

---

## Tables
- material_orders – represents SAP production / material orders

---

## Why MySQL?
- Common SAP downstream datastore
- Widely used in enterprise landscapes
- Fully supported by Debezium CDC

---

## CDC Requirements
- binlog_format = ROW
- log_bin = ON
- Unique server-id
