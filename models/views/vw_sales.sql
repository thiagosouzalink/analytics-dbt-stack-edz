WITH source_sales AS(
    SELECT *
    FROM sales
),

renamed AS (
    SELECT salesid AS id_venda,
           listid AS id_lista,
           sellerid AS id_vendedor,
           buyerid AS id_comprador,
           eventid AS id_evento,
           dateid AS id_date,
           qtysold AS quantidade_vendida,
           pricepaid AS valor_pago,
           commission AS comissao,
           to_char(saletime, 'dd/mm/yyyy HH24:MI:SS') AS data_hora_venda,
           cast(saletime AS date) AS data_venda,
           to_char(saletime, 'HH24:MI:SS') AS hora_venda
    FROM source_sales
)

SELECT * FROM renamed
