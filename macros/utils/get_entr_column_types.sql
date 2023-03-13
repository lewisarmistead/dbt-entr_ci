{% macro get_entr_column_types() %}
    {% set overrides = var('entr_column_type_overrides', {}) %}
    {% set coltypes = {
        "PLANT_ID": dbt_utils.type_int(),
        "PLANT_NAME": dbt_utils.type_string(),
        "LATITUDE": dbt_utils.type_numeric(),
        "LONGITUDE": dbt_utils.type_numeric(),
        "PLANT_CAPACITY": dbt_utils.type_numeric(),
        "NUMBER_OF_TURBINES": dbt_utils.type_int(),
        "TURBINE_CAPACITY": dbt_utils.type_numeric(),
        "WIND_TURBINE_ID": dbt_utils.type_int(),
        "WIND_TURBINE_NAME": dbt_utils.type_string(),
        "ELEVATION": dbt_utils.type_numeric(),
        "HUB_HEIGHT": dbt_utils.type_numeric(),
        "ROTOR_DIAMETER": dbt_utils.type_numeric(),
        "RATED_POWER": dbt_utils.type_numeric(),
        "MANUFACTURER": dbt_utils.type_string(),
        "PLANT_NAME": dbt_utils.type_string(),
        "MODEL": dbt_utils.type_string(),
        "REANALYSIS_DATASET_ID": dbt_utils.type_int(),
        "REANALYSIS_DATASET_NAME": dbt_utils.type_string(),
        "ENTR_TAG_ID": dbt_utils.type_int(),
        "DATE_TIME": dbt_utils.type_timestamp(),
        "TAG_VALUE": dbt_utils.type_numeric(),
        "INTERVAL_S": dbt_utils.type_numeric(),
        "VALUE_TYPE": dbt_utils.type_string(),
        "VALUE_UNITS": dbt_utils.type_string(),
        "ENTR_TAG_NAME": dbt_utils.type_string(),
        "LOGICAL_NODE": dbt_utils.type_string(),
        "SENSOR_NAME": dbt_utils.type_string(),
        "PRESENTATION_NAME": dbt_utils.type_string(),
        "STANDARD_UNITS": dbt_utils.type_string(),
        "DATA_TYPE": dbt_utils.type_string(),
        "COLLECTOR_TYPE": dbt_utils.type_string(),
    } %}
    {% for k,v in overrides.items() %}
        {% do coltypes.update({k:v}) %}
    {% endfor %}
    {{return(coltypes)}}
{% endmacro %}
