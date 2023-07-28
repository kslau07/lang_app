class AnsweredQuestion < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  validates :user_answer, presence: true
  # validates :question_id, presence: true
end
