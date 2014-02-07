function onChangeType() {
  var question_type = $("#question_question_type").val();

  switch (question_type) {
    case "M":
      $("#answer_area_for_choice_questions").show();
      $("#answer_area_for_text_questions").hide();
      break;
    case "S":
      $("#answer_area_for_choice_questions").show();
      $("#answer_area_for_text_questions").hide();
      break;
    case "T":
      $("#answer_area_for_choice_questions").hide();
      $("#answer_area_for_text_questions").show();
      break;
    case "E":
      $("#answer_area_for_choice_questions").hide();
      $("#answer_area_for_text_questions").show();
      break;
  }
}