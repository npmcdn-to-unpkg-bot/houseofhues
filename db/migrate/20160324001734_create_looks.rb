class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.references :color, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :img
      t.integer :boosts, default: 0

      t.timestamps null: false
    end
  end
end
