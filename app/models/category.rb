class Category < ActiveRecord::Base

  has_many :posts

  validates :name, length: { maximum: 20 }, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :sidebar, length: { maximum: 5120 }
  validates :submission_text, length: { maximum: 1024 }

  default_scope { order('lower(name)')}
  scope :added_lately, -> { where('created_at > ?', 1.hour.ago) }
  scope :redundant_find, -> (id) { where(id: id)}
  scope :added_after, -> (time) {where('created_at > ?', time) }

  scope :lambda_find, lambda { |id| where(id: id) }
  scope :proc_find, Proc.new { |id| where(id: id) }

end
