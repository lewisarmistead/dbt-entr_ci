with
    src as (select * from {{ref('seed_wtg_scada_data_example')}})

select * from src
