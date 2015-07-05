class AdminArticle < Upmin::Model
  attributes :uri, :description, :status, :facebook, :linkedin, :twitter
  form_attributes :entry_id, :uri, :description, :categories, :status, :author

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