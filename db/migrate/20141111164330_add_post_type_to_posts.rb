class AddPostTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :integer, default: 0
    Post.find_each do |post|
      post.post_type = 1 unless post.body.blank?
      post.post_type = 0 unless post.link.blank?
      post.save!
    end
  end

  def down
    remove_column :posts, :post_type
  end
end
