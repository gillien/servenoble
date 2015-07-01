class AdminArticle < Upmin::Model
  attributes :uri, :description, :status, :facebook, :linkedin, :twitter

  actions :update_social_attributes

  def title
    object.title
  end

  def update_social_attributes
    ArticleServices::Synchronize.new(object).call
    'Completed'
  end
end