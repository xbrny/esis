class Subject < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :department
  validates :department_id, presence: true
  validates :code, presence: true, length: { minimum: 5, maximum: 20 }
  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }

end
