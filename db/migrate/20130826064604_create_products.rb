class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :number
      t.text :content
      t.string :use
      t.string :load

      t.timestamps
    end
  end
end
