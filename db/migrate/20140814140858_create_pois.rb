class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.integer :tour_id
      t.string :name
      t.string :description
      t.decimal :lat, precision: 12, scale: 6
      t.decimal :lng, precision: 12, scale: 6
      t.string :image

      t.timestamps
    end
  end
end
