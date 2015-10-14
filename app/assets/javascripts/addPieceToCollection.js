function showUserCollections (){
  $("#addToCollection").on("click", function(){
    event.preventDefault();

    var url = $(this).attr("href");

    var split_data = $(this).attr("href").split("/")

    var userId = split_data[2]
    var collectionId = split_data[4]
    var pieceId = split_data[6]

    var toSend = {user_id: userId,
                  collection_id: collectionId,
                  piece_id: pieceId}

    var request = $.ajax({
      type: "get",
      url: url,
      data: toSend
    });

    request.done(function(response){
      $("#addCollections").append(response)
    });

    addPieceToCollection(pieceId);

  });
}

function addPieceToCollection(input_pieceId){
  $("#addCollections").on('click', ".willAdd", function(){
    event.preventDefault();

    var url = $(this).attr("href");
    var split_data = $(this).attr("href").split("/");

    var userId = split_data[2]
    var collectionId = split_data[4]

    var toSend = {user_id: userId,
                  collection_id: collectionId,
                  piece_id: input_pieceId}

    var request = $.ajax({
      type: "get",
      url: url,
      data: toSend
    });

    request.done(function(response){
      console.log(response)
    });

    $(this).fadeOut(400);

  });
}
