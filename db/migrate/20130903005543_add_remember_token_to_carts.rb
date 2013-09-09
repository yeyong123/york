class AddRememberTokenToCarts < ActiveRecord::Migration
  def change
		add_column :carts, :remember_token, :string
		add_index :carts, :remember_token
  end
end
