class Post < ActiveRecord::Base

  belongs_to :category

  validates :title, length: { maximum: 255 }, presence: true
  validates :link, presence: true, if: :link?
  validates :link, length: { maximum: 2000 }
  validates :body, presence: true, if: :text?
  validates :category_id, presence: true
  enum post_type: [:link, :text]
end
