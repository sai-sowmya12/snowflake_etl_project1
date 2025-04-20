CREATE OR REPLACE TASK SALES_TASK
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
  WHEN SYSTEM$STREAM_HAS_DATA('my_sales_stream')
AS
  MERGE INTO SALES_DB.SALES_SCHEMA.SALES_TGT T
  USING SALES_DB.SALES_SCHEMA.my_sales_stream S
  ON T.order_id = S.order_id
  WHEN MATCHED THEN
    UPDATE SET
      T.order_date = S.order_date,
      T.product = S.product,
      T.quantity = S.quantity,
      T.price = S.price,
      T.profit_loss = CASE WHEN S.quantity > 2 THEN 'Profit' ELSE 'Loss' END
  WHEN NOT MATCHED THEN
    INSERT (order_id, order_date, product, quantity, profit_loss, price)
    VALUES (
      S.order_id, S.order_date, S.product, S.quantity,
      CASE WHEN S.quantity > 2 THEN 'Profit' ELSE 'Loss' END,
      S.price
    );