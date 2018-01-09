view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }


  measure: price_sum {
    type: sum
    sql: ${sale_price} ;;
    #value_format: "$#.00"
   # html: {{rendered_value}} ({{percent_of_total_case._rendered_value}}) ;;
  }

  measure: price_average {
    type: average
    sql: ${sale_price} ;;
    value_format: "$#.00"
    html: {{rendered_value}} ({{percent_of_total_case._rendered_value}}) ;;
  }

  parameter: param {
    type: string
    allowed_value: {
      label: "sum"
      value: "price_sum"
    }
    allowed_value: {
      label: "average"
      value: "price_average"
    }
  }

  measure: percent_of_total_case {
    type: percent_of_total
    sql:
      CASE WHEN {% parameter param %} = "price_sum" THEN ${price_sum}
            WHEN {% parameter param %} = "price_average" THEN ${price_average}
            END
    ;;
  }

  measure: percent_of_total_if_then {
    type: percent_of_total
    sql:
      {% if order_items.price_sum._in_query %}
        ${price_sum}
      {% elsif order_items.price_average._in_query %}
        ${price_average}
      {% else %}
        ""
      {% endif %}
    ;;
  }



  measure: count {
    type: count_distinct
    sql: ${id} ;;
    link: {
      label: "order_list"
      url: "/dashboards/20?id={{ order_items_list._value | replace: '|RECORD|', ',' }}"
    }
  }
  measure: order_items_list {
    type: list
    list_field: id
  }
}
