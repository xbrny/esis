class Department < ApplicationRecord
  has_many :subjects

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
end
