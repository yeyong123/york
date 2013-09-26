class AddCustomerIdToDirectory < ActiveRecord::Migration
  def change
    add_column :directories, :customer_id, :integer
  end
end
