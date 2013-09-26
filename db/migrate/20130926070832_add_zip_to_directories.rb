class AddZipToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :zip, :string
  end
end
