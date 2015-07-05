class AdminArticle < Upmin::Model
  attributes :uri, :description, :status, :facebook, :linkedin, :twitter

  actions :update_social_attributes

  def title
    object.title
  end

  def update_social_attributes
    if ArticleServices::Synchronize.new(object).call
      'Completed'
    else
      object.errors.full_messages.to_sentence
    end
  end
end