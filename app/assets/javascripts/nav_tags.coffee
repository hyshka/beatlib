## on page change for turbolinks
$(document).on "page:update", ->
  # tags menu toggle
  $('.nav-tags-btn').on 'click', (event) ->
    event.preventDefault()
    $('#tags').toggleClass('active')
    event.stopPropagation();
    return
  $('.sort-tag').on 'click', (event) ->
    $('#tags').removeClass('active')
    return
  $('html').click (e) ->
    #if clicked element is not your element and parents aren't your div
    if e.target.id != 'tags' and $(e.target).parents('#tags').length == 0
      #hide tags
      $('#tags').removeClass('active')
    else
    return