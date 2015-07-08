class AdminSource < Upmin::Model
  attributes :key, :uri, :logo, :description, :updated_at
  form_attributes :key, :uri, :logo, :description

  actions :get_last_articles

  def get_last_articles
    "#{SourceServices::Synchronize.new(object).call} article(s) created"
  end

  class << self
    def associations
      []
    end
  end
end