# view: sql_runner_query_1 {
#   derived_table: {
#     sql: select state, COUNT(*) from users where state = "California" group by 1
#       ;;
#   }
#
#   dimension: state {
#     type: string
#     sql: ${TABLE}.state ;;
#   }
#
#   dimension: count {
#     type: string
#     sql: ${TABLE}.`COUNT(*)` ;;
#   }
#
#   set: detail {
#     fields: [state, count]
#   }
# }
