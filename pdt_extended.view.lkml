include: "pdt_base.view"

view: pdt_extended {
  extends: [pdt_base]
  derived_table: {
    datagroup_trigger: test_pm_2
  }

  dimension: id {
    type: number
  }


  }
