connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: users {
  view_label: "test"
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id}= ${orders.user_id}  ;;
  }
  join: order_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items.order_id} = ${orders.id} ;;
  }
}

explore: users_ndt {}

explore: order_items  {}


datagroup: test_pm {
  max_cache_age: "1 hour"
  sql_trigger: SELECT 1 ;;
}

explore: pdt_extended {}
