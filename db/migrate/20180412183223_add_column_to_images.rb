class AddColumnToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :handle, :string
  end
end
