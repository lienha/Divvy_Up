class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user_id
      t.belongs_to :recommendation_id
      t.integer :value
      t.timestamps
    end
  end
end
