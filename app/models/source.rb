class Source < ActiveRecord::Base
  self.primary_key = :key

  has_many :articles

  has_attached_file :logo, styles: { thumb: "50x50>" }, default_url: 'http://placehold.it/50x50'

  validates :description, presence: true
  validates :key, presence: true, uniqueness: true
  validates :uri, presence: true, format: URI::regexp(%w(http https))
end
