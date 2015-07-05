class AdminSource < Upmin::Model
  attributes :key, :uri, :description, :updated_at

  actions :get_last_articles

  def get_last_articles
    "#{SourceServices::Synchronize.new(object).call} article(s) created"
  end
end