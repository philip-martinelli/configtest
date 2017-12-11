include: "model_two.model"
view: users_ndt {

  derived_table: {
    explore_source: users {
      timezone: "America/Chicago"
    column: date { field:orders.created_date }
    column: count {}
  }

}

dimension_group: date {
  type: time
  timeframes: [date,year,time,month]
  sql: ${TABLE}.date ;;
}

dimension: count {
  type: number
  sql: ${TABLE}.count ;;
}

  }
