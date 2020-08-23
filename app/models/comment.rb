class Comment < ApplicationRecord
  belongs_to :mask
  belongs_to :user
end
