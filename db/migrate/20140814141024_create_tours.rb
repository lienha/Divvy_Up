class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :zoom, default: 12
      t.column :center, :json
      t.integer :creator_id

      t.timestamps
    end
  end
end
