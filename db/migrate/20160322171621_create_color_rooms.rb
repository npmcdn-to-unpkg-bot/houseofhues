class CreateColorRooms < ActiveRecord::Migration
  def change
    create_table :color_rooms do |t|
      t.references :color, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
    end
  end
end
