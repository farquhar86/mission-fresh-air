class AddShipedTime < ActiveRecord::Migration
  def change
  	add_column :purchases, :shipped, :timestamp
  end
end
