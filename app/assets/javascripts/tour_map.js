var pathname = window.location.pathname;
var mapOptions = {};
var markers_and_infos = {};
markers_and_infos['marker'] = [];
markers_and_infos['info'] = [];
var marker_id = 0;
var poi_array = [];
var map;
var total_stations_info = [];
var close_all_info_windows = function(){
  if (total_stations_info.length > 0){
    for (x = 0; x< total_stations_info.length ; x++){
      total_stations_info[x].close();
    }
  }
};
function loader(){
  var glide = $('.slider').glide().data('api_glide');
  var waypts = [];

  var start = {};
  var end = {};
  var request = {};
  map = new google.maps.Map(document.getElementById('map'));
  var directionsService = new google.maps.DirectionsService();
  var directionsDisplay = new google.maps.DirectionsRenderer({
    polylineOptions: {
      strokeColor: "rgba(255,180,0,0.8)",
      strokeWeight: 6
      },
    suppressMarkers: true,
    geodesic: true,
    draggable: true
  });
  $.getJSON(pathname + '.json', function(resp){
      var json_loc = resp;
      $.each(resp.pois, function(index, value){
        value.lat = parseFloat(value.lat);
        value.lng = parseFloat(value.lng);
      });
      center = new google.maps.LatLng(resp.lat, resp.lng);
      mapOptions = {
              zoom:resp.zoom,
              center: center,
              zoomControl: true
            };
      map.setOptions(mapOptions);


      $.each(resp.pois, function(index, val){
        $.ajax({url:"http://shrouded-beach-2183.herokuapp.com/stations/nearby",
          data: {
          lat: val.lat,
          lon: val.lng},
          type: "GET",
          dataType: "json",
          success: function(json){
          var created_station_ids = [];
          var stations = [];
          var stations_info = [];
            for (var i = json.length - 1; i >= 0; i--) {
              if (created_station_ids.indexOf(json[i].properties.id) === -1) {
                stations[i] = new google.maps.Marker({
                  map: map,
                  position: new google.maps.LatLng(json[i].geometry.coordinates[1], json[i].geometry.coordinates[0]),
                  visible: true,
                  zIndex: 1000,
                  icon: '/assets/map-icon-inservice.png',
                  animation: google.maps.Animation.DROP
                });
              }
              created_station_ids.push(json[i].properties.id);
              stations_info[i] = new google.maps.InfoWindow();
              stations_info[i].setOptions({
                  content: 'Station Name: ' + json[i].properties.stationName + ' <br> Available Bikes: ' + json[i].properties.availableBikes + '<br> Available Docks: ' + json[i].properties.availableDocks, zIndex: 1000,
                  height: 180,
                  position: new google.maps.LatLng(json[i].geometry.coordinates[1], json[i].geometry.coordinates[0])
                });
              total_stations_info[total_stations_info.length] = stations_info[i];
            }
            stations.forEach(function(loc, ind){
              google.maps.event.addListener(loc, 'click', function(){
                close_all_info_windows();
                stations_info[ind].open(map, loc);
              });
            });
          }
        });
      });
      poi_array = resp.pois;
      $.each(resp.pois, function(index, value){
        marker_id = value.id;
        markers_and_infos['marker'][index] = new google.maps.Marker({
          position: new google.maps.LatLng(value.lat, value.lng),
          title: value.name,
          id: value.id,
          visible: true,
          zIndex: 102
          });
        console.log(value);

        markers_and_infos['info'][index] = new google.maps.InfoWindow();

        markers_and_infos['marker'][index].setMap(map);
        google.maps.event.addListener(markers_and_infos['marker'][index], 'click', function(){
          markers_and_infos['info'][index].open(map, markers_and_infos['marker'][index]);
        });
        google.maps.event.addListener(markers_and_infos['marker'][index], 'click', function() {
          glide.jump(index+1);
        });
      });
      $.each(json_loc.pois, function(index, value){
    if (index !== 0 || index !== json_loc.pois.length -1){
    waypts.push({
      location: new google.maps.LatLng(value.lat, value.lng),
      stopover: false});
      }
    });

    request = {
      origin: new google.maps.LatLng(resp.pois[0].lat, resp.pois[0].lng),
      destination: new google.maps.LatLng(resp.pois[resp.pois.length - 1].lat, resp.pois[resp.pois.length - 1].lng),
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.BICYCLING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }

  directionsDisplay.setMap(map);
  });


  });

}

var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=loader';

$(window).load(function(){
  document.body.appendChild(script);
});