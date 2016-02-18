var map;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 8
  });
}

$(function(){
	$( "#events" ).delegate( ".event-item", "click", function() {
	  var event_item = $(this)
		var event_item_id = event_item.data("event-id")

		var lat = event_item.data("event-lat")
		var lon = event_item.data("event-lon")
		
		map.panTo(new google.maps.LatLng(lat, lon))
    map.setZoom(16)
	});
})