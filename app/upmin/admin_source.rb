class AdminSource < Upmin::Model
  attributes :key, :uri, :description, :updated_at

  actions :get_last_articles

  def get_last_articles
    SourceServices::Synchronize.new.call_for(self)

    "Completed"
  end

end