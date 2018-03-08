connection: "thelook"

#include: "*.view.lkml"
# include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

include: "/schemas_test_3/schemas_test_3.model"
include: "/schemas_test_3/*.view"

#s change

# explore: users {
#   join: dt {
#     type: inner
#     relationship: many_to_one
#     sql_on: ${dt.state} = ${users.state} ;;
#   }
# }

explore: users_extended {
  extends: [users_schema]
}


##




#p change
