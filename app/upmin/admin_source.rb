##
# Administration for Source.
class AdminSource < Upmin::Model
  attributes :key, :uri, :logo, :language, :description, :updated_at
  form_attributes :key, :uri, :language, :logo, :description

  actions :last_articles

  def last_articles
    "#{SourceServices::Synchronize.new(object).call} article(s) created"
  end

  class << self
    def associations
      []
    end
  end
end
