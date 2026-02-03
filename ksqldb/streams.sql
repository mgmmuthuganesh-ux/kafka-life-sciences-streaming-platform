
-- =========================================================
-- STREAMS.SQL
-- Purpose: Convert Debezium CDC events into clean business streams
-- =========================================================

-- Read from beginning when creating streams
SET 'auto.offset.reset' = 'earliest';

-- Raw CDC stream (Debezium payload wrapper)
CREATE STREAM material_orders_raw (
  PAYLOAD STRUCT<
    BEFORE STRUCT<
      ORDER_ID INT,
      MATERIAL_CODE STRING,
      PLANT STRING,
      QUANTITY INT,
      ORDER_STATUS STRING,
      CREATED_AT STRING
    >,
    AFTER STRUCT<
      ORDER_ID INT,
      MATERIAL_CODE STRING,
      PLANT STRING,
      QUANTITY INT,
      ORDER_STATUS STRING,
      CREATED_AT STRING
    >,
    OP STRING
  >
) WITH (
  KAFKA_TOPIC = 'sap.sap.material_orders',
  VALUE_FORMAT = 'JSON'
);

-- Clean business stream (flatten CDC envelope)
CREATE STREAM material_orders_clean AS
SELECT
  PAYLOAD->AFTER->ORDER_ID        AS ORDER_ID,
  PAYLOAD->AFTER->MATERIAL_CODE  AS MATERIAL_CODE,
  PAYLOAD->AFTER->PLANT          AS PLANT,
  PAYLOAD->AFTER->QUANTITY       AS QUANTITY,
  PAYLOAD->AFTER->ORDER_STATUS   AS ORDER_STATUS,
  PAYLOAD->AFTER->CREATED_AT     AS CREATED_AT
FROM material_orders_raw
WHERE PAYLOAD->AFTER IS NOT NULL
EMIT CHANGES;
