class AddPositionToLook < ActiveRecord::Migration
  def change
    add_column :looks, :position, :integer
  end
end
