class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.integer :tour_id
      t.string :name
      t.string :description
      t.string :location
      t.string :image

      t.timestamps
    end
  end
end
