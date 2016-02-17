App.events = App.cable.subscriptions.create "EventsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	event = data['event']
  	map.panTo(new google.maps.LatLng(event.lat, event.lon));
  	console.log JSON.stringify event