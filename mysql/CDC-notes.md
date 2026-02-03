# CDC Configuration Notes

## MySQL Settings Required for CDC
- binlog_format=ROW
- binlog_row_image=FULL
- log_bin=ON
- unique server-id

## Why ROW-Based Binlog?
- Captures before/after images
- Required for Debezium CDC
- Enables accurate updates & deletes

## Common Issues
- CDC not working → binlog disabled
- Duplicate events → non-unique server-id
- Missing updates → STATEMENT binlog format
