select * from
{{entr.union_entr_relations(
    entr_table='fct_entr_plant_data',
    column_list=dbt_utils.get_filtered_columns_in_relation(ref('int_fct_entr_plant_data__structured'))
)}}
