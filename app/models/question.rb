class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :ques_content, presence: true
  validates :correct_answer, presence: true

  accepts_nested_attributes_for :category
end
