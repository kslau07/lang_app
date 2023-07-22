class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :questions
  has_many :quizzes
  has_many :answered_questions, through: :quizzes
  

  def email_required?
    true
  end

  def will_save_change_to_email?
    false
  end

  def email_changed?
    false
  end
end
