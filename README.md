
---

## Pipeline Flow

1. Data Files (CSV) are placed in an AWS S3 bucket.
2. Snowflake Stage points to the S3 bucket using a Storage Integration.
3. Snowpipe auto-ingests the files into the `raw_sales` table.
4. Stream captures changes in `raw_sales`.
5. Task runs every minute to merge new data into the `SALES_TGT` table and adds a `profit_loss` column based on `quantity > 2`.

---

## Tables

- `raw_sales`: Raw data ingested from S3.
- `SALES_TGT`: Target table with business logic applied.
- `my_sales_stream`: Stream tracking changes to `raw_sales`.

---

## Sample Business Logic

In the `SALES_TGT` table:
- If `quantity > 2`, `profit_loss = 'Profit'`
- Else, `profit_loss = 'Loss'`

---

## How to Run

1. Create the database, schema, tables, and file format using `sql_scripts/create_database_and_schema.sql`.
2. Set up storage integration and external stage using `create_stage_and_pipe.sql`.
3. Load data into the S3 bucket (sample files provided).
4. Snowpipe auto-loads the data into `raw_sales`.
5. Stream captures changes; Task merges into `SALES_TGT`.

---

## Sample Output

| order_id | order_date | product  | quantity | profit_loss | price |
|----------|------------|----------|----------|-------------|-------|
| O101     | 2025-04-20 | Laptop   | 3        | Profit      | 899.99 |
| O102     | 2025-04-20 | Headset  | 1        | Loss        | 49.99  |

---



