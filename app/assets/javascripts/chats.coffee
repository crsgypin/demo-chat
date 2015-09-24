client = new Faye.Client('/faye')

client.subscribe '/chat', (payload)->
  # time = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  # You probably want to think seriously about XSS here:
  console.log(payload)
  $('#chat ul').append("<li> #{payload.content}</li>")

$(document).ready ->
  # button = $('#submit')
  input = $('#chat-input')
  $('form#new_chat').submit (event) ->
 #   button.attr('disabled', 'disabled')
    # button.val('Posting...')
    console.log(input.val())
    publication = client.publish '/chat',
      content: input.val()
      # created_at: new Date()
    publication.callback ->
      input.val('')
      # button.removeAttr('disabled')
      # button.val("Post")
    publication.errback ->
      # button.removeAttr('disabled')
      # button.val("Try Again")
    event.preventDefault()
    false

# in case anyone wants to play with the inspector.
window.client = client
