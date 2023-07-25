class Category < ApplicationRecord
  has_many :questions
  belongs_to :user
  # validates :name, presence: { message: 'Your custom error message' }, uniqueness: true
  # validate :validate_floor
  validate :validate_name
  

  

  accepts_nested_attributes_for :questions


private

def validate_name
  return if name.present?

  errors.add(:category, ' is required, please select or create one.')
end


  
end
