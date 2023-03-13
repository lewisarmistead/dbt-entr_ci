with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt_utils.type_int()}}) as reanalysis_dataset_id,
    cast(null as {{dbt_utils.type_string()}}) as reanalysis_dataset_name
from dummy_cte
where 1=0
