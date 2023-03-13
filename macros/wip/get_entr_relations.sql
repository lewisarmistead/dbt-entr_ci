{#

{% macro get_entr_relations(entr_table) -%}
    {{ return(adapter.dispatch('get_entr_relations', 'entr')(entr_table)) }}
{% endmacro %}

{% macro default__get_entr_relations(entr_table) %}
    {% set identified_relations = [] %}
    {% if execute %}
        {% for node in graph.nodes.values() | selectattr("resource_type", "in", ["model", "seed"]) %}
            {%- if node.config.meta.get('entr_table') == entr_table %}
                {% do identified_relations.append( node.name ) %}
            {% endif -%}
        {% endfor%}
    {% else %}
        {% do identified_relations.append( '' ) %}
    {% endif %}
    {{ return(identified_relations) }}
{% endmacro %}
#}
