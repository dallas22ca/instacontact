$(document).on "focus", "#task_body", ->
  Clients.unselect()

$(document).on "change", ".client_state", ->
  $(this).closest("form").submit()

$(document).on "click", ".client", ->
  Clients.select $(this), "true"
  false

$(document).on "click", ".close", ->
  Clients.unselect()
  false

$(document).on "click", ".suggester", ->
  $(this).find("form").show()
  
$(document).on "keyup", (e) ->
  code = ((if e.keyCode then e.keyCode else e.which))

  if code == 27 # ESC
    $(".selected").find("form").submit()
    Clients.unselect()
    false
  else if code == 83 # S
    if !$("*:focus").length
      Clients.unselect()
      $("#q").focus()
      false
  else if code == 80 # P
    if !$("*:focus").length
      Clients.unselect()
      $("#task_body").focus()
      false
  else if code is 40 or code is 38
    if !$("#clients .selected").length && code is 40
      Clients.select $("#clients li:visible:first")
    else
      if code is 40
        selection = $("#clients .selected").nextAll(":visible:first")
      else if code is 38
        selection = $("#clients .selected").prevAll(":visible:first")

      Clients.select selection
  else if code is 13
    if !$("#task_body:focus").length && $(".selected:visible").length
      $(".selected").click()
      if $(".selected").hasClass "suggester"
        $(".selected").find("input:visible:first").focus()

$(document).on "keyup", "#q", (e) ->
  code = ((if e.keyCode then e.keyCode else e.which))
  q = $("#q").val()

  $("#clients .suggester .name").text q
  $("#client_name").val q
  $(".client").each ->
    body = $(this).find(".info").text().toLowerCase() + $(this).find("select option:selected").text().toLowerCase()
    if body.indexOf(q.toLowerCase()) != -1
      $(this).show()
    else
      $(this).hide()

  if !$(".selected:visible").length || $(".selected").index() == $("#clients li").length - 1
    Clients.select $("#clients li:visible:first")
      
@Clients =
  unselect: () ->
    $("#clients .open").removeClass "open"
    $("*:focus").blur()
  
  select: (el, open = "false") ->
    $("#clients .open").removeClass "open"
    $("#clients .selected").removeClass "selected"
    el.addClass "selected"
    
    if open == "true"
      el.addClass "open"
    
    el.find("input:visible:first").focus()