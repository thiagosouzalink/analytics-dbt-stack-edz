select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    SELECT *
    FROM "dev"."public"."vw_sales"
    WHERE comissao < 0

      
    ) dbt_internal_test