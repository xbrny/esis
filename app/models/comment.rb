class Comment < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates :subject, presence: true
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
