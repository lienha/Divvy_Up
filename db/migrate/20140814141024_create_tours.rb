class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :zoom, default: 12
      t.decimal :lat,  precision: 12, scale: 6
      t.decimal :lng, precision: 12, scale: 6
      t.integer :creator_id

      t.timestamps
    end
  end
end
