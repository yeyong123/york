class AddListIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :list_id, :integer
  end
end
