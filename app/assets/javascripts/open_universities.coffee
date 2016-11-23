# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# My gratitude for script to railcast http://railscasts.com/episodes/370-ransack
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).closest('.field').remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    
 jQuery ->
  # Ajax sorting and pagination on click
  $('#open_universities th.sortable a, #open_universities .pagination a').on('click', ->
    $.getScript(this.href)
    false
  )
  # Ajax search on submit
  $('#open_universities').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )
  # Ajax search on keyup
  $('#open_universities_search input').keyup( ->
    $.get($("#open_universities_search").attr("action"), $("#open_universities_search").serialize(), null, 'script')
    false
  )