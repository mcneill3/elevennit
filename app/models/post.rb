class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :user


  validates :title, length: { maximum: 255 }, presence: true
  validates :link, presence: true, if: :link?
  validates :link, length: { maximum: 2000 }
  validates :body, presence: true, if: :text?
  validates :category_id, presence: true
  enum post_type: [:link, :text]

  default_scope { order('updated_at DESC').includes(:category).includes(:user) }

  # default_scope { order('updated_at DESC')}
  scope :with_categories, -> { includes(:category) }

  self.per_page = 8
end
