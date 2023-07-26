class Quiz < ApplicationRecord
  has_many :answered_questions
  belongs_to :user
  # belongs_to :category

  accepts_nested_attributes_for :answered_questions
end
