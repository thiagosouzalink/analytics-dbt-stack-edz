-- Define as variáveis meses e ano



-- Cria a fonte com os dados de date e converte o nome das colunas
WITH source_date AS (
    SELECT dateid AS id_date,
           month AS mes,
           year AS ano
    FROM date
),

-- Cria a fonte de dados unindo a tabela sales como date
sales_date AS(
    SELECT source_date.mes,
           sum(quantidade_vendida)
    FROM "dev"."public"."vw_sales" sales 
    INNER JOIN source_date
    ON sales.id_date = source_date.id_date
    WHERE source_date.mes IN ('JAN', 'FEB', 'MAR')
          AND source_date.ano = '2008'
    GROUP BY source_date.mes
)
SELECT * FROM sales_date