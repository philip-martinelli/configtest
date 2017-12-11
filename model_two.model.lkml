connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: users {
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id}= ${orders.user_id}  ;;
  }
}

explore: users_ndt {}

explore: order_items  {}
