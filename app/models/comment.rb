class Comment < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates :subject, presence: true
  validates :user, presence: true
end
