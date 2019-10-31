class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :permalink, limit: 150
      t.string :title, limit: 100
      t.text :content
      t.boolean :release
      t.datetime :release_date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
