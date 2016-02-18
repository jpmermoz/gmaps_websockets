App.events = App.cable.subscriptions.create "EventsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    event = data['event']
    alertify.success(event['description'])

    $("#events").prepend(data['html_item'])

    badge_count = parseInt($("#event-menu").attr('data-badge'))

    if isNaN(badge_count)
    	$('#event-menu').attr 'data-badge', 1
    else
    	$('#event-menu').attr 'data-badge', parseInt($('#event-menu').attr('data-badge')) + 1