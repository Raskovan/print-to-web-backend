class AddColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :img_name, :string
  end
end
