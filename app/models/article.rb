class Article < ActiveRecord::Base
  belongs_to :source

  enum status:  %i(pending approved archived)

  default_scope { order('published_at DESC') }

  validates :title, :description, :categories, :source, presence: true
  validates :facebook, :linkedin, :twitter, :comments, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: Article.statuses.keys }
  validates :entry_id, uniqueness: true
  validates :uri, presence: true, format: URI::regexp(%w(http https))
end
