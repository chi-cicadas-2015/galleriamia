function googleMaps() {
  function initialize() {
    var cityCoordinates = document.getElementsByClassName('city')[0].id;
    var cityLat = Number(cityCoordinates.split(",")[0]);
    var cityLng = Number(cityCoordinates.split(",")[1]);

    var allElements = document.getElementsByClassName('location');
    var allIds = getIds(allElements);
    var allLatlng = getLatlngs(allIds);
    var mapCanvas = document.getElementById('map');


    var mapOptions = {
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: {lat: cityLat, lng: cityLng}
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    var markers = [];
    for (i = 0; i < allLatlng.length; i++) {
      var marker = new google.maps.Marker({
        position: allLatlng[i]
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
};
