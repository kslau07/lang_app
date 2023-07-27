class Quiz < ApplicationRecord
  has_many :question_answers
  belongs_to :user
  # belongs_to :category

  accepts_nested_attributes_for :question_answers
end
