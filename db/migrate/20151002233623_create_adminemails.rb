class CreateAdminemails < ActiveRecord::Migration
  def change
    create_table :adminemails do |t|
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
