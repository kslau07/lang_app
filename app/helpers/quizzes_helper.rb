module QuizzesHelper
  def remove_underscores!(question_string)
    question_string.gsub!("_", "")
  end
end
