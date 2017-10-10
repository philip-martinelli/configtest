view: dt {
derived_table: {
  sql:
    SELECT
    state,
    COUNT(distinct id) as state_count
    FROM demo_db.users
    GROUP BY 1
  ;;
}

dimension: state {
  type: string
  sql: ${TABLE}.state ;;
}

dimension: state_count {
  type: number
  sql: ${TABLE}.state_count ;;
}

}
