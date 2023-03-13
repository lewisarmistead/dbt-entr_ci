{% macro get_entr_column_types() %}
    {% set overrides = var('entr_column_type_overrides', {}) %}
    {% set coltypes = {
        "PLANT_ID": dbt_utils.type_int(),
        "WIND_TURBINE_ID": dbt_utils.type_int(),
        "REANALYSIS_DATASET_ID": dbt_utils.type_int(),
        "ENTR_TAG_ID": dbt_utils.type_int(),
        "DATE_TIME": dbt_utils.type_timestamp(),
        "TAG_VALUE": dbt_utils.type_numeric(),
        "INTERVAL_S": dbt_utils.type_numeric(),
        "VALUE_TYPE": dbt_utils.type_string(),
        "VALUE_UNITS": dbt_utils.type_string(),
    } %}
    {% for k,v in overrides.items() %}
        {% do coltypes.update({k:v}) %}
    {% endfor %}
    {{return(coltypes)}}
{% endmacro %}