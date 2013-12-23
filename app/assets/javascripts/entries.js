
$(document).on('ready page:load', function() {

  var entry_list = $("#entries");
  var poll_id = entry_list.data('poll-id');
  var token = $("#token").text();
  var url = poll_id + "/vote?token=" + token;
  entry_list.sortable()

  var sorted = $('#entries').sortable("toArray");

  entry_list.on("sortupdate", function() {
    sorted = $('#entries').sortable("toArray");

  });

  $("#vote").on('click', function(){

    var req = $.ajax({
          url: url,
          type: "POST",
          data: {entries: sorted},
          dataType: "JSON"
        });

        req.done(function( data ) {
          window.location = data.path
        });

        req.fail(function( data ) {
          alert('fail');
        });

  });

});
