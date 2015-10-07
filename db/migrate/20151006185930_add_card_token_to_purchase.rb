class AddCardTokenToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :card_token, :string
  end
end
