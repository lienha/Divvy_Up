class AddDetailsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :short_description, :string
    add_column :tours, :long_description, :string
  end
end
