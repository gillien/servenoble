class Source < ActiveRecord::Base
  self.primary_key = :key

  has_many :articles

  validates :description, presence: true
  validates :key, presence: true, uniqueness: true
  validates :uri, presence: true, format: URI::regexp(%w(http https))
end
