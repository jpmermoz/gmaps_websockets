App.events = App.cable.subscriptions.create "EventsCreateChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    event = data['event']
    alertify.success(event['description'])

    $("#events").prepend(data['html_item'])

    badge_count = parseInt($("#event-menu").attr('data-badge'))

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(event['start_position']['lat'], event['start_position']['lng']),
      map: map,
      title: event['description']
    })

    if event['event_positions'].length <= 1
      return

    event_positions = event['event_positions'].map((el, i) ->
      return { lat: parseFloat(el.lat), lng: parseFloat(el.lng) }
    )

    event_path = new google.maps.Polyline({
      path: event_positions,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    event_path.setMap(map);
  
    if isNaN(badge_count)
    	$('#event-menu').attr 'data-badge', 1
    else
    	$('#event-menu').attr 'data-badge', parseInt($('#event-menu').attr('data-badge')) + 1

App.events = App.cable.subscriptions.create "EventsUpdateChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    event = data['event']

    if event['event_positions'].length <= 1
      return

    event_positions = event['event_positions'].map((el, i) ->
      return el.lat + ", " + el.lng
    )

    waypoints = event_positions.slice(1, -1).map((el, i) ->
      return { location: el, stopover: true }
    )

    directionsDisplay = new google.maps.DirectionsRenderer({map: map})
    directionsService = new google.maps.DirectionsService()

    request = {
      origin: event_positions[0]
      destination: event_positions[event_positions.length - 1]
      waypoints: waypoints
      provideRouteAlternatives: false
      travelMode: google.maps.TravelMode.WALKING
    }

    directionsService.route request, (response, status) ->
      directionsDisplay.setDirections(response)