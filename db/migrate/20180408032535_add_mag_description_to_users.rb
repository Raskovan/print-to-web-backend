class AddMagDescriptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mag_description, :string
  end
end
