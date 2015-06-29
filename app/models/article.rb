class Article < ActiveRecord::Base
  belongs_to :source

  default_scope { order('id DESC') }

  validates :entry_id, uniqueness: true

  def update_social_attributes
    SourceServices::Synchronize.new.call_for(self)
  end
end
