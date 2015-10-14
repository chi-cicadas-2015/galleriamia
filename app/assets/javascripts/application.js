// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  function initialize() {
    var allElements = document.getElementsByClassName('location');
    var allIds = getIds(allElements);
    var allLatlng = getLatlngs(allIds);
    var mapCanvas = document.getElementById('map');

    var mapOptions = {
      zoom: 8,
      center: allLatlng[0],
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    var markers = [];
    for (i = 0; i < allLatlng.length; i++) {
      var marker = new google.maps.Marker({
        position: allLatlng[i],
        title: "Hello World!"
      });
      marker.setMap(map);
    };
  };

  function getIds(elements) {
    var allIds = [];
    for (i = 0, n = elements.length; i < n; ++i) {
      var el = elements[i];
      if (el.id) { allIds.push(el.id); }
    };
    return allIds;
  };

  function getLatlngs(ids) {
    var latLngs = [];
    for (i = 0; i < ids.length; i++) {
      var lat = Number(ids[i].split(",")[0]);
      var lon = Number(ids[i].split(",")[1]);
      var myLatlng = new google.maps.LatLng(lat, lon);
      latLngs.push(myLatlng);
    };
    return latLngs;
  };

  google.maps.event.addDomListener(window, 'load', initialize);
});
