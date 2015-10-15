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

  $('.follow').on('click', function(e) {
    e.preventDefault();
    $(this).html('<i class="unfollow secondary-content medium material-icons icon_color">favorite</i>');
  });

  $('.unfollow').on('click', function(e) {
    e.preventDefault();
    $(this).html('<i class="follow secondary-content medium material-icons icon_color">favorite_border</i>');
  });

  showUserCollections();

  googleMaps();
})
