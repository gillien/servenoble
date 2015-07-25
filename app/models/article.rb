class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_or_none, against: [:title, :description, :categories]

  belongs_to :source

  enum status:  %i(pending approved archived)

  default_scope { order('published_at DESC') }

  validates :title, :description, :categories, :source, presence: true
  validates :facebook, :linkedin, :twitter, :comments, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: Article.statuses.keys }
  validates :entry_id, uniqueness: true
  validates :uri, presence: true, format: URI::regexp(%w(http https))

  class << self
    def search(criteria)
      req = criteria[:keywords].present? ? search_or_none(criteria[:keywords]) : order(created_at: :desc)

      req = req.where(source_id:  criteria[:source_id])   if criteria[:source_id].present?
      req = req.where(status:     criteria[:status])      if criteria[:status].present?

      req
    end
  end
end
