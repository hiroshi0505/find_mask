class Mask < ApplicationRecord
  validates :name, :text, :image, presence: true
end
