class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  before_save { self.student_id = student_id.upcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :student_id, presence: { message: "Student ID can't be blank" },
            uniqueness: { case_sensitive: false, message: "Student ID already exist" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
