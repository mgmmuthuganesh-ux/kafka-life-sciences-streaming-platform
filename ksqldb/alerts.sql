-- =========================================================
-- ALERTS.SQL
-- Purpose: Detect high-impact business events in real time
-- =========================================================

-- Alert when unusually large orders arrive
CREATE STREAM high_quantity_orders AS
SELECT
  ORDER_ID,
  MATERIAL_CODE,
  PLANT,
  QUANTITY,
  ORDER_STATUS,
  CREATED_AT
FROM material_orders_clean
WHERE QUANTITY > 5000
EMIT CHANGES;
