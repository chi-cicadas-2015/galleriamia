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
    var that = $(this);
    var artistId = $('.col-xs-4').attr('id');
    var artistName = $('.col-xs-4 ').html();

    $.ajax({
      url: "/users/" + artistId + "/friends/new"
    })
    .done(function(response) {
      $('#info_friends').append('<h5 id="friend_link"><a href="/users/" + artistId>' + artistName + '</a></h5><br>')
      that.html('<i class="unfollow secondary-content medium material-icons icon_color">favorite</i>');
    });

  });

  $('.unfollow').on('click', function(e) {
    e.preventDefault();
    var that = $(this);
    var artistId = $('.col-xs-4').attr('id');
    var followerId = $('.user').attr('id');
    var artistName = $('.col-xs-4 ').html();

    $.ajax({
      url: "/users/" + artistId + "/friends/" + followerId + "/edit"
    })
    .done(function(response) {
      $('#info_friends').remove('<h5 id="friend_link"><a href="/users/" + artistId>' + artistName + '</a></h5><br>')
      that.html('<i class="follow secondary-content medium material-icons icon_color">favorite_border</i>');
    });

  });

  showUserCollections();

  googleMaps();
})
