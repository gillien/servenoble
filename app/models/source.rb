class Source < ActiveRecord::Base
  self.primary_key = :key

  has_many :articles

  validates :key, uniqueness: true, presence: true
  validates :uri, format: URI::regexp(%w(http https))
end
