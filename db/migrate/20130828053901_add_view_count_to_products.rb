class AddViewCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :view_count, :integer, default: 0
  end
end
