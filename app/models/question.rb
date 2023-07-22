class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :body, presence: true
  validates :correct_answer, presence: true
end
