$(function() {

  var records_list = $("#records");

  records_list.sortable()

  records_list.on("sortupdate", function() {
    var sorted = $('#records').sortable("serialize", { key: "record" } );
    console.log(sorted);
  });


});
