# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.create-comment').on('ajax:beforeSend', (evt, xhr, settings) ->
    $submitButton = $(this).find('input[name="commit"]')
    # Update the text of the submit button to let the user know stuff is happening.
    # But first, store the original text of the submit button, so it can be restored when the request is finished.
    $submitButton.data 'origText', $(this).text()
    $submitButton.text 'Submitting...'
    return
  ).on('ajax:success', (evt, data, status, xhr) ->
    $form = $(this)
    # Reset fields and any validation errors, so form can be used again, but leave hidden_field values intact.
    $form.find('textarea,input[type="text"],input[type="file"]').val ''
    $form.find('div.validation-error').empty()
    # Insert response partial into page below the form.
    $('#comments').append xhr.responseText
    return
  ).on('ajax:complete', (evt, xhr, status) ->
    $submitButton = $(this).find('input[name="commit"]')
    # Restore the original submit button text
    $submitButton.text $(this).data('origText')
    return
  ).on 'ajax:error', (evt, xhr, status, error) ->
    $form = $(this)
    errors = undefined
    errorText = undefined
    try
      # Populate errorText with the comment errors
      errors = $.parseJSON(xhr.responseText)
    catch err
      # If the responseText is not valid JSON (like if a 500 exception was thrown), populate errors with a generic error message.
      errors = message: 'Please reload the page and try again'
    # Build an unordered list from the list of errors
    errorText = 'There were errors with the submission: \n<ul>'
    for error of errors
      `error = error`
      errorText += '<li>' + error + ': ' + errors[error] + '</li> '
    errorText += '</ul>'
    # Insert error list into form
    $form.find('div.validation-error').html errorText
    return
  return
