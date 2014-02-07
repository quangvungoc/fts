module QuestionsHelper
  def getTypeName(type)
    case type
    when "S" then
      "Singular choice"
    when "M" then
      "Multiple choice"
    when "T" then
      "Text"
    when "E" then
      "Excercise"
    else 
      "Type not exist"
    end
  end

  def correct?(answer)
    answer.correct_answer == 1
  end
end
