$(document).on "page:update", ->
  # main menu toggle
  $('#menu-button').on 'click', (event) ->
    event.preventDefault()
    $('#main-nav').toggleClass('active')
    event.stopPropagation();
    return
  $('html').click (e) ->
    #if clicked element is not your element and parents aren't your div
    if e.target.id != 'main-nav' and $(e.target).parents('#main-nav').length == 0
      #hide menu
      $('#main-nav').removeClass('active')
    else
    return