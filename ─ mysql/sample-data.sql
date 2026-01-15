
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
