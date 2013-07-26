$(document).on "click", ".task_checkbox", ->
  $(this).closest(".task").find(".delete").click()
  false