WITH sales AS(
    SELECT * FROM "dev"."public"."vw_sales"
),

compradores AS(
    SELECT (firstname ||' '|| lastname) AS nome_completo,
           userid
    FROM users
),

top_10_compradores AS (
    SELECT compradores.nome_completo AS nome_completo,
           sum(sales.quantidade_vendida) AS vendas_totais,
           sales.comissao AS comissao
    FROM sales
    INNER JOIN compradores
    ON sales.id_comprador = compradores.userid
    GROUP BY compradores.userid, 
             compradores.nome_completo, 
             sales.comissao
    LIMIT 10
)

SELECT * FROM top_10_compradores