class Question < ApplicationRecord
  belongs_to :category
  validates :body, presence: true
  validates :answer, presence: true
end
