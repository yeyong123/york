class AddQuantityToProductUsers < ActiveRecord::Migration
  def change
    add_column :product_users, :quantity, :integer, default: 1
  end
end
