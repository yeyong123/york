class AddCityIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :city_id, :integer
  end
end
