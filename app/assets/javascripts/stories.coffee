# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#story-form").on("ajax:success", (e, data, status, xhr) ->
    $("#flash").append "<div id='flash_alert'>Successfully saved story.</div>"
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#flash").append "<div id='flash_error'>Unable to save story.</div>"