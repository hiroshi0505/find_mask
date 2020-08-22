class RemoveNameFromMasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :masks, :name, :string
  end
end
