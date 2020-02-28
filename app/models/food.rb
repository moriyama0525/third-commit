class Food < ApplicationRecord
  has_many :stores, dependent: :delete_all
  has_many :users, through: :stores

  has_many :comments, dependent: :delete_all
  has_many :foods, through: :comments

  belongs_to :cock

  mount_uploader :image, ImageUploader
end
