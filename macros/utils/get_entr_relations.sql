{% macro get_entr_relations(entr_table) -%}
    {{ return(adapter.dispatch('get_entr_relations', 'entr')(entr_table)) }}
{% endmacro %}

{% macro default__get_entr_relations(entr_table) %}

    {#-- Prevent querying of db in parsing mode. This works because this macro does not create any new refs. -#}
    {%- if not execute %}
        {{ return('') }}
    {% endif -%}

    {% set identified_relations = [] %}
    {% for node in graph.nodes.values() | selectattr("resource_type", "in", ["model", "seed"]) %}
        {%- if node.config.meta.get('entr_table') == entr_table %}
            {% do identified_relations.append( ref(node.name) ) %}
        {% endif -%}
    {% endfor%}
    {{ return(identified_relations) }}
    
{% endmacro %}
