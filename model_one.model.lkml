connection: "thelook"

include: "dt.view.lkml"
include: "datagroups.view"
include: "users.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: users {
  join: dt {
    type: inner
    relationship: many_to_one
    sql_on: ${dt.state} = ${users.state} ;;
  }
}
