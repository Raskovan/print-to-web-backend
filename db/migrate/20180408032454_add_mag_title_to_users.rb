class AddMagTitleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mag_title, :string
  end
end
