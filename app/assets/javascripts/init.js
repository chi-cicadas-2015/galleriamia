$( document ).ready(function(){
  $('.button-collapse').sideNav({
    menuWidth: 300,
    edge: 'left',
    closeOnClick: true
  });

  $('.slider').slider({
    full_width: true,
    indicators: false,
    transition: 1000,
  });

  showUserCollections();

  googleMaps();
})
