{% macro get_entr_column_types() %}
    {% set overrides = var('entr_column_type_overrides', {}) %}
    {% set coltypes = {
        "ASSET_ID": dbt.type_int(),
        "ASSET_NAME": dbt.type_string(),
        "ASSET_TYPE": dbt.type_string(),
        "ENTR_TAG_ID": dbt.type_int(),
        "TAG_SUBTYPE_ID": dbt.type_int(),
        "ENTR_TAG_NAME": dbt.type_string(),
        "TAG_SUBTYPE_DESCRIPTION": dbt.type_string(),
        "DATE_TIME": dbt.type_timestamp(),
        "TAG_VALUE": dbt.type_numeric(),
        "INTERVAL_S": dbt.type_numeric(),
        "VALUE_TYPE": dbt.type_string(),
        "VALUE_UNITS": dbt.type_string(),
        "LOGICAL_NODE": dbt.type_string(),
        "SENSOR_NAME": dbt.type_string(),
        "PRESENTATION_NAME": dbt.type_string(),
        "STANDARD_UNITS": dbt.type_string(),
        "DATA_TYPE": dbt.type_string(),
        "COLLECTOR_TYPE": dbt.type_string(),
    } %}
    {% for k,v in overrides.items() %}
        {% do coltypes.update({k:v}) %}
    {% endfor %}
    {{return(coltypes)}}
{% endmacro %}
