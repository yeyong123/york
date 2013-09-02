class AddLikedCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :liked_count, :integer, default: 0
  end
end
