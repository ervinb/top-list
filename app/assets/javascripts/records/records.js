$(function() {

  var records_list = $("#records");
  var poll_id = records_list.data('poll-id');
  var url = poll_id + "/vote"
  records_list.sortable()

  var sorted = $('#records').sortable("toArray");

  records_list.on("sortupdate", function() {
    sorted = $('#records').sortable("toArray");
  });

  $("#vote").on('click', function(){

    $.ajax({
      url: url,
      type: "POST",
      data: {records: sorted},
      dataType: "JSON"
    });

  });

});
