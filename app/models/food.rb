class Food < ApplicationRecord
  has_many :stores, dependent: :delete_all
  has_many :users, through: :stores
  belongs_to :cock

  mount_uploader :image, ImageUploader
end
