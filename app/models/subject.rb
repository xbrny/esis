class Subject < ApplicationRecord
  has_many :comments, dependent: :destroy
end
