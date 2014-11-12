class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
    # add_column :posts, :category_id, :integer
    add_reference :posts, :category, index: true
  end
end
