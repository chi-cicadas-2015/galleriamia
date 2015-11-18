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
    var that = $(this).parent().parent();
    var artistId = $('.col-xs-4').attr('id');
    var followerId = $('.user').attr('id');
    var artistName = $('.col-xs-4 ').html();

    $.ajax({
      url: "/users/" + artistId + "/friends/new"
    })
    .done(function() {
      $('#info_friends').append('<h5 class="friend_link"><a href="/users/' + artistId + '">' + artistName + '</a></h5><br>')

      var url = "/users/" + artistId + "/friends/" + followerId + "/edit"

      that.html('<a href=' + url + '><i class="unfollow secondary-content medium material-icons icon_color">favorite</i></a>');
    });
  });

  $('.unfollow').on('click', function(e) {
    e.preventDefault();
    var that = $(this).parent().parent();
    var artistId = $('.col-xs-4').attr('id');
    var followerId = $('.user').attr('id');
    var artistName = $('.col-xs-4 ').html();

    $.ajax({
      dataType: "html",
      url: "/users/" + artistId + "/friends/" + followerId + "/edit"
    })
    .done(function() {
      var url = "/users/" + artistId + "/friends/new"

      that.html('<a href=' + url + '><i class="follow secondary-content medium material-icons icon_color">favorite_border</i></a>');
    });
  
  });

  showUserCollections();

  googleMaps();
})
