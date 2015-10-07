class AddTelephoneToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :telephone, :string
  end
end
