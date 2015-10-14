function addPieceToCollection (){
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
      console.log("this came back")
      console.log(response)
    });
  });
}
