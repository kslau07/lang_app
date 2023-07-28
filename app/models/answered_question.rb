class AnsweredQuestion < ApplicationRecord
  belongs_to :quiz
  validates :user_answer, presence: true
  validates :question_id, presence: true
end
