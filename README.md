# Snowflake ETL Project

## Overview
This is an ETL project using Snowflake. It demonstrates loading CSV data from an S3 bucket, using Snowpipe for automation, and performing data transformations with Snowflake Streams and Tasks.

## Folder Structure
- `sql/`: Contains all SQL scripts for schema, table, pipe, stage, stream, and task creation.
- `data/`: Contains sample data files in CSV format.

## Setup Instructions

1. **Create the Database and Schema**  
   Run the script `01_create_schema.sql` to create the necessary database and schema.

2. **Create Tables**  
   Run the script `02_create_tables.sql` to create the `raw_sales` and `SALES_TGT` tables.

3. **Create Stage, File Format, and Pipe**  
   Run the script `03_create_pipe_and_stage.sql` to create the stage, file format, and Snowpipe.

4. **Create Stream and Task**  
   Run the script `04_create_stream_and_task.sql` to create the stream and task that automatically load data into the target table.

5. **Load Data**  
   Once everything is set up, load your CSV data into the `SALES_TGT` table.

## Contributing
Feel free to fork and submit pull requests.

## License
This project is licensed under the MIT License.
