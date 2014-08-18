class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :tour_id
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
