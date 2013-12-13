$(function() {

  var records_list = $("#records");
  var poll_id = records_list.data('poll-id');
  var url = poll_id + "/vote"

  records_list.sortable()

  records_list.on("sortupdate", function() {

    var sorted = $('#records').sortable("toArray");
    console.log(url);

    $.ajax({
      url: url,
      type: "POST",
      data: {records: sorted},
      dataType: "JSON"
    });

  });


});
