class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :zoom, default: 12
      t.string :center
      t.integer :creator_id

      t.timestamps
    end
  end
end
