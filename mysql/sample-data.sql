AWS RDS-> create databases - add inbound ruls for mysql and create parameters group and enable below values must and apply immediatly 
Step 1: Create MySQL in AWS RDS (Browser)
AWS Console → RDS → Create database

Choose these options carefully:

Engine: MySQL

Version: MySQL 8.0

Template: Free tier

DB instance identifier:

kafka-cdc-mysql


Master username:

admin


Public access: Yes

VPC security group:

Allow inbound 3306 from your IP
Parameter	Value
binlog_format	ROW
binlog_row_image	FULL
binlog_checksum	NONE


Open cloudshell to run the mysql query.

~ $ mysql -h (AWS RDS host) -u admin -p
Enter password: 

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 33
Server version: 8.0.43 Source distribution

MySQL [(none)]> CREATE DATABASE sap_db;
Query OK, 1 row affected (0.019 sec)

MySQL [(none)]> CREATE DATABASE lab_db;
Query OK, 1 row affected (0.006 sec)

MySQL [(none)]> CREATE DATABASE shopfloor_db;
Query OK, 1 row affected (0.012 sec)

MySQL [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| lab_db             |
| mysql              |
| performance_schema |
| sap_db             |
| shopfloor_db       |
| sys                |
+--------------------+
7 rows in set (0.005 sec)



  
MySQL [(none)]> CREATE USER 'debezium'@'%' IDENTIFIED BY 'dbz';
Query OK, 0 rows affected (0.020 sec)

MySQL [(none)]> GRANT SELECT, RELOAD, SHOW DATABASES,
    ->       REPLICATION SLAVE, REPLICATION CLIENT
    -> ON *.* TO 'debezium'@'%';
Query OK, 0 rows affected (0.005 sec)

MySQL [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.006 sec)





MySQL [sap_db]> use sap_db
Database changed
MySQL [sap_db]>
MySQL [sap_db]> CREATE TABLE sap_orders (
    ->   order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ->   order_number VARCHAR(50),
    ->   customer_id VARCHAR(50),
    ->   order_status VARCHAR(20),
    ->   order_amount DECIMAL(10,2),
    ->   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ->     ON UPDATE CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.072 sec)

MySQL [sap_db]> USE lab_db;
Database changed
MySQL [lab_db]> CREATE TABLE lab_results (
    ->   test_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ->   sample_id VARCHAR(50),
    ->   test_type VARCHAR(50),
    ->   test_status VARCHAR(20),
    ->   result_value VARCHAR(50),
    ->   event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.029 sec)

MySQL [lab_db]> use shopfloor_db
Database changed
MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> CREATE TABLE shopfloor_events (
    ->   event_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ->   machine_id VARCHAR(50),
    ->   event_type VARCHAR(30),
    ->   event_status VARCHAR(20),
    ->   event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.060 sec)

MySQL [shopfloor_db]> show tables;

+------------------------+
| Tables_in_shopfloor_db |
+------------------------+
| shopfloor_events       |
+------------------------+
1 row in set (0.002 sec)

MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> use sap_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MySQL [sap_db]>
MySQL [sap_db]> USE sap_db;
Database changed
MySQL [sap_db]>
MySQL [sap_db]> INSERT INTO sap_orders
    -> (order_number, customer_id, order_status, order_amount)
    -> VALUES
    -> ('ORD-1001', 'CUST-1', 'CREATED', 1200.50),
    -> ('ORD-1002', 'CUST-2', 'SHIPPED', 540.00);
Query OK, 2 rows affected (0.005 sec)
Records: 2  Duplicates: 0  Warnings: 0

MySQL [sap_db]> USE lab_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MySQL [lab_db]>
MySQL [lab_db]> INSERT INTO lab_results
    -> (sample_id, test_type, test_status, result_value)
    -> VALUES
    -> ('SMP-101', 'COVID-PCR', 'COMPLETED', 'NEGATIVE'),
    -> ('SMP-102', 'BLOOD', 'FAILED', 'ERROR');
Query OK, 2 rows affected (0.005 sec)
Records: 2  Duplicates: 0  Warnings: 0

MySQL [lab_db]> USE shopfloor_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> INSERT INTO shopfloor_events
    -> (machine_id, event_type, event_status)
    -> VALUES
    -> ('MC-01', 'TEMPERATURE', 'NORMAL'),
    -> ('MC-02', 'MOTOR', 'DOWN');
Query OK, 2 rows affected (0.006 sec)
Records: 2  Duplicates: 0  Warnings: 0

MySQL [shopfloor_db]> UPDATE sap_db.sap_orders
    -> SET order_status='DELIVERED'
    -> WHERE order_number='ORD-1001';
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> DELETE FROM lab_db.lab_results
    -> WHERE sample_id='SMP-102';
Query OK, 1 row affected (0.006 sec)

MySQL [shopfloor_db]> SELECT * FROM sap_db.sap_orders;
+----------+--------------+-------------+--------------+--------------+---------------------+---------------------+
| order_id | order_number | customer_id | order_status | order_amount | created_at          | updated_at          |
+----------+--------------+-------------+--------------+--------------+---------------------+---------------------+
|        1 | ORD-1001     | CUST-1      | DELIVERED    |      1200.50 | 2026-01-15 15:47:13 | 2026-01-15 15:48:27 |
|        2 | ORD-1002     | CUST-2      | SHIPPED      |       540.00 | 2026-01-15 15:47:13 | 2026-01-15 15:47:13 |
+----------+--------------+-------------+--------------+--------------+---------------------+---------------------+
2 rows in set (0.002 sec)

MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> SELECT * FROM lab_db.lab_results;
+---------+-----------+-----------+-------------+--------------+---------------------+
| test_id | sample_id | test_type | test_status | result_value | event_time          |
+---------+-----------+-----------+-------------+--------------+---------------------+
|       1 | SMP-101   | COVID-PCR | COMPLETED   | NEGATIVE     | 2026-01-15 15:47:33 |
+---------+-----------+-----------+-------------+--------------+---------------------+
| test_id | sample_id | test_type | test_status | result_value | event_time          |
+---------+-----------+-----------+-------------+--------------+---------------------+
|       1 | SMP-101   | COVID-PCR | COMPLETED   | NEGATIVE     | 2026-01-15 15:47:33 |
+---------+-----------+-----------+-------------+--------------+---------------------+
1 row in set (0.001 sec)

MySQL [shopfloor_db]> 
MySQL [shopfloor_db]> SELECT * FROM shopfloor_db.shopfloor_events;
+----------+------------+-------------+--------------+---------------------+
| event_id | machine_id | event_type  | event_status | event_time          |
+----------+------------+-------------+--------------+---------------------+
|        1 | MC-01      | TEMPERATURE | NORMAL       | 2026-01-15 15:47:50 |
|        2 | MC-02      | MOTOR       | DOWN         | 2026-01-15 15:47:50 |
+----------+------------+-------------+--------------+---------------------+
2 rows in set (0.001 sec)
