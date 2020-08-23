class AddUserIdToMasks < ActiveRecord::Migration[6.0]
  def change
    add_column :masks, :user_id, :integer
  end
end
