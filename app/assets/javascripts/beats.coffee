# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

## on page change for turbolinks
$(document).on "page:update", ->

  # setup our controls to play/pause beats
  $('.play-pause-btn').on 'click', ->
    # set var for this button
    $playToggle = $(this).children("span")
    # set var for beat ID
    $dom_id = $(this).attr('data-dom-id')
    # get the beat's audio element
    beatAudio = document.getElementById( $dom_id )
    # if beat isn't playing than play the audio
    if beatAudio.paused
      beatAudio.play()
      $playToggle.removeClass("fa-play").addClass("fa-pause")
    # otherwise pause it
    else
      beatAudio.pause()
      $playToggle.removeClass("fa-pause").addClass("fa-play")
    # if beat finished then pause it and reset icon
    beatAudio.addEventListener 'ended', (->
      beatAudio.pause()
      $playToggle.removeClass("fa-pause").addClass("fa-play")
      return
    ), true
    return
