class Mask < ApplicationRecord
  has_one_attached :image # maskモデルの各レコードは1つの画像ファイルを添付できる
  validates :name, :text, :image, presence: true

  # (これ必要か？)画像さえあれば、nameとtextが無くても投稿が可能となる
  # validates :name, :text, presence: true, unless: :was_attached?
  # def was_attached?
  #   self.image.attached?
  # end
end
