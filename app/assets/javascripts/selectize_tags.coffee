## on page change for turbolinks
$(document).on "page:update", ->

  # Selectize.js
  $('#beat_tag_list').selectize
    plugins: ['remove_button', 'drag_drop']
    persist: false
    create: true
    maxItems: 5
    createOnBlur: true
    maxOptions: 10
    createFilter: (input) ->
      #min length of 3 characters
      input.length >= parseInt(3, 10)

  # Selectize.js with unique filter
  #unique = $('#beat_tag_list').selectize(
  #  plugins: ['remove_button', 'drag_drop']
  #  persist: false
  #  create: true
  #  createOnBlur: true
  #  maxItems: 5
  #  createFilter: (input) ->
  #    input = input.toLowerCase()
  #    $.grep(unique.getValue(), (value) ->
  #      value.toLowerCase() == input
  #    ).length == 0
  #  )[0].selectize
