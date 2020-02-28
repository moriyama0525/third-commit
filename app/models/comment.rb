class Comment < ApplicationRecord
  validates :comment, presence: true, length: {maximum: 1000}
  belongs_to :food
  belongs_to :user
end
