class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :permalink
      t.string :title
      t.text :content
      t.boolean :release
      t.datetime :release_date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
