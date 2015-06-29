class Source < ActiveRecord::Base
  self.primary_key = :key

  has_many :articles

  validates :key, uniqueness: true, presence: true
  validates :uri, format: URI::regexp(%w(http https))

  def synchronize
    latest_entry = articles.last

    Feedjira::Feed.fetch_and_parse(uri).entries.map do |e|
      return [] if latest_entry.present? && e.entry_id != latest_entry.entry_id

      articles.create(
        entry_id:     e.entry_id,
        uri:          e.url,
        description:  e.summary,
        title:        e.title,
        categories:   e.categories
      )
    end
  end
end
