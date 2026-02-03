-- =========================================================
-- AGGREGATIONS.SQL
-- Purpose: Real-time analytics using ksqlDB TABLEs
-- =========================================================

-- Orders per plant (real-time)
CREATE TABLE orders_by_plant AS
SELECT
  PLANT,
  COUNT(*)      AS TOTAL_ORDERS,
  SUM(QUANTITY) AS TOTAL_QUANTITY
FROM material_orders_clean
GROUP BY PLANT
EMIT CHANGES;
