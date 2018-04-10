class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :position
      t.boolean :published
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :body
      t.string :quote

      t.timestamps
    end
  end
end
