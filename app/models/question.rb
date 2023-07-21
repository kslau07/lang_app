class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :body, presence: true
  validates :answer, presence: true
end
