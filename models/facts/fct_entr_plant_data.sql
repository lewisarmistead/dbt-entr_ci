{% set relation_names = var('fct_entr_plant_models') %}
{% set relations = [] %}
{%- for rel in relation_names %}
-- depends_on: {{ref(rel)}}
    {% do relations.append( ref(rel) ) %}
{% endfor -%}


select * from
{{dbt_utils.union_relations(
    relations=relations,
    include=dbt_utils.get_filtered_columns_in_relation(ref('int_fct_entr_plant_data__structured')),
    column_override={
        "PLANT_ID": dbt_utils.type_int(),
        "WIND_TURBINE_ID": dbt_utils.type_int(),
        "REANALYSIS_DATASET_ID": dbt_utils.type_int(),
        "ENTR_TAG_ID": dbt_utils.type_int(),
        "DATE_TIME": dbt_utils.type_timestamp(),
        "TAG_VALUE": dbt_utils.type_numeric(),
        "INTERVAL_S": dbt_utils.type_numeric(),
        "VALUE_TYPE": dbt_utils.type_string(),
        "VALUE_UNITS": dbt_utils.type_string(),
    }
)}}
