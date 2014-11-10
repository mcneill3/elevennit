class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link, limit: 2000
      t.text :body
      t.timestamps
    end
  end
end
