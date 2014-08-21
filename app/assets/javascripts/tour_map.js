var pathname = window.location.pathname;
var mapOptions = {};
var markers_and_infos = {};
markers_and_infos['marker'] = [];
markers_and_infos['info'] = [];
var marker_id = 0;
var poi_array = [];
var map;
var total_stations_info = [];
var tour_center;
var close_all_info_windows = function(){
  if (total_stations_info.length > 0){
    for (x = 0; x< total_stations_info.length ; x++){
      total_stations_info[x].close();
    }
  }
};
var stop_marker_jump = function(){
  if (markers_and_infos['marker'].length > 0){
    for (x = 0; x< markers_and_infos['marker'].length; x++){
      markers_and_infos['marker'][x].setAnimation(null);
    }
  }
};
function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';

  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}


function loader(){
  function get_nearest_station(pos){
    console.log(pos);
    $.ajax({url:"http://shrouded-beach-2183.herokuapp.com/stations/nearby",
      data:{
      lat: pos.k,
      lon: pos.B,
      max_stations: 1
      },
      type: "GET",
      dataType: "json",
      success: function(json){
        json = json[0];
        var nearest_station_info;
        var nearest_station = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(json.geometry.coordinates[1], json.geometry.coordinates[0]),
          visible: true,
          zIndex: 1000,
          icon: '/assets/map-icon-inservice.png',
          animation: google.maps.Animation.DROP
        });
        nearest_station_info = new google.maps.InfoWindow();
        nearest_station_info.setOptions({
          content: 'Station Name: ' + json.properties.stationName + ' <br> Available Bikes: ' + json.properties.availableBikes + '<br> Available Docks: ' + json.properties.availableDocks, zIndex: 1000,
          height: 180,
          position: new google.maps.LatLng(json.geometry.coordinates[1], json.geometry.coordinates[0])
        });
        google.maps.event.addListener(nearest_station, 'click', function(){
          nearest_station_info.open(map, nearest_station);
        });
        var directionsRequest = {
          origin: pos,
          destination: new google.maps.LatLng(json.geometry.coordinates[1], json.geometry.coordinates[0]),
          travelMode: google.maps.DirectionsTravelMode.WALKING,
          unitSystem: google.maps.UnitSystem.METRIC
        };
        directionsService.route(
          directionsRequest,
          function(response, status)
          {
            if (status == google.maps.DirectionsStatus.OK)
            {
              new google.maps.DirectionsRenderer({
                map: map,
                directions: response
              });
            }
            else
              $("#error").append("Unable to retrieve your route<br />");
          }
        );
      }
    });
  }
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

  var center;
  $.getJSON(pathname + '.json', function(resp){

      var json_loc = resp;
      $.each(resp.pois, function(index, value){
        value.lat = parseFloat(value.lat);
        value.lng = parseFloat(value.lng);
      });
      center = new google.maps.LatLng(resp.lat, resp.lng);
      tour_center = center;
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
                  zIndex: 30,
                  icon: '/assets/map-icon-inservice.png',
                  animation: google.maps.Animation.DROP
                });
              }
              created_station_ids.push(json[i].properties.id);
              stations_info[i] = new google.maps.InfoWindow();
              stations_info[i].setOptions({
                  content: 'Station Name: ' + json[i].properties.stationName + ' <br> Available Bikes: ' + json[i].properties.availableBikes + '<br> Available Docks: ' + json[i].properties.availableDocks, zIndex: 100,
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
          zIndex: 50
          });
        console.log(value);

        markers_and_infos['info'][index] = new google.maps.InfoWindow();

        markers_and_infos['marker'][index].setMap(map);
        google.maps.event.addListener(markers_and_infos['marker'][index], 'click', function(){
          markers_and_infos['info'][index].open(map, markers_and_infos['marker'][index]);
        });
        google.maps.event.addListener(markers_and_infos['marker'][index], 'click', function() {
          glide.jump(index+2);
          stop_marker_jump();
          markers_and_infos['marker'][index].setAnimation(google.maps.Animation.BOUNCE);
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
  $('#my_divvy').click(function(){
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
      function(position) {
        var pos = new google.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);
        var current_loc_info = new google.maps.InfoWindow({
          map: map,
          position: pos,
          content: 'You are here.'
        });
        map.setCenter(pos);
        get_nearest_station(pos);
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }
  });


}

var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=loader';


$(window).load(function(){
  document.body.appendChild(script);
});