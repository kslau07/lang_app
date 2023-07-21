class Category < ApplicationRecord
  has_many :questions
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :questions
end
