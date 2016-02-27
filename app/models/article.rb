##
# Main model, which include Article details
class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_or_none, against: %w(title description categories)

  belongs_to :source

  enum status:  %i(pending approved translated archived)

  default_scope { order('published_at DESC') }

  validates :title, :description, :categories, :source, presence: true
  validates :facebook, :linkedin, :twitter, :comments,
            numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: Article.statuses.keys }
  validates :entry_id, uniqueness: true
  validates :uri, presence: true, format: URI.regexp(%w(http https))

  class << self
    def search(criteria)
      req = order(created_at: :desc)
      req = search_or_none(criteria[:keywords]) if criteria[:keywords].present?

      req = req.where(source_id: criteria[:source_id]) if criteria[:source_id].present?
      req = req.where(status: criteria[:status]) if criteria[:status].present?

      %w(facebook linkedin twitter).each do |social_type|
        req = req.where(
          "\"articles\".\"#{social_type}\" >= :gt AND \"articles\".\"#{social_type}\" <= :lt",
          gt: criteria[:"#{social_type}_gt"] || 0,
          lt: criteria[:"#{social_type}_lt"] || 99_999)
      end

      req
    end
  end
end
