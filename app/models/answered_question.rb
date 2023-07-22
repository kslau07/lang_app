class AnsweredQuestion < ApplicationRecord
  belongs_to :quiz
  validates :answer, presence: true
  validates :question_id, presence: true
end
