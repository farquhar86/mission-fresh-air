class AddAddressToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :street, :string
    add_column :purchases, :city, :string
    add_column :purchases, :state, :string
    add_column :purchases, :country, :string
    add_column :purchases, :zip, :string
    add_column :purchases, :first_name, :string
    add_column :purchases, :last_name, :string
  end
end
