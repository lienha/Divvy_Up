class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_table :pois do |t|
      t.change :description, :text
    end
  end
end
