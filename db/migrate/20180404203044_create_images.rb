class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :article_id
      t.integer :position
      t.string :url
      t.string :caption

      t.timestamps
    end
  end
end
