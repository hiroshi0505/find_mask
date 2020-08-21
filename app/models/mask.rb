class Mask < ApplicationRecord
  has_one_attached :image
  validates :name, :text, :image, presence: true
end
