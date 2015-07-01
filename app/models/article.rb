class Article < ActiveRecord::Base
  belongs_to :source

  enum status:  %i(pending kept archived)

  default_scope { order('id DESC') }

  validates :entry_id, uniqueness: true
end
