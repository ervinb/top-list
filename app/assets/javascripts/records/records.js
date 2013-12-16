$(function() {

  var entry_list = $("#entries");
  var poll_id = entry_list.data('poll-id');
  var url = poll_id + "/vote"
  entry_list.sortable()

  var sorted = $('#entries').sortable("toArray");

  entry_list.on("sortupdate", function() {
    sorted = $('#entries').sortable("toArray");
  });

  $("#vote").on('click', function(){

    $.ajax({
      url: url,
      type: "POST",
      data: {entries: sorted},
      dataType: "JSON"
    });

  });

});
