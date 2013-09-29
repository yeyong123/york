class AddDistrictIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :district_id, :integer
  end
end
