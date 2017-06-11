class Subject < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :code, presence: true, length: { minimum: 5, maximum: 20 }
  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }

end
