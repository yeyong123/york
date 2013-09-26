class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :telphoneumber
      t.string :hangye
      t.integer :province_id
      t.integer :city_id
      t.integer :district_id
      t.string :company
      t.string :tel

      t.timestamps
    end
  end
end
