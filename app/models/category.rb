class Category < ApplicationRecord
  has_many :questions
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :questions
end
