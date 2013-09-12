class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address
      t.string :email
      t.string :phone
      t.string :name
      t.string :telphone
      t.string :fax

      t.timestamps
    end
  end
end
