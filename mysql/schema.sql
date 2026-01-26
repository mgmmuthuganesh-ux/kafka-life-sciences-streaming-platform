
CREATE DATABASE IF NOT EXISTS sap;
USE sap;

CREATE TABLE material_orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  material_code VARCHAR(50),
  plant VARCHAR(50),
  quantity INT,
  order_status VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
