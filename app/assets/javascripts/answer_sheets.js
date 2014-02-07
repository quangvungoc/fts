function getExamList() {
  var subject_id = $('#answer_sheet_subject_id').val();
  $.ajax({
    type: "GET",
    dataType: "json",
    url: "/subjects/" + subject_id + "/exams",
    success: function(data){
      var html = "";
      var index;
      for (index = 0; index < data.length; index++) {
        html = html + "<option value=\"" + data[index].id + "\">" + data[index].name + "</option>"
      }
      $("#answer_sheet_exam_id").html(html);
    }
  }); 
}
