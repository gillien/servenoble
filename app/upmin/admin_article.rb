class AdminArticle < Upmin::Model
  attributes :title, :uri, :description, :facebook, :linkedin, :twitter

  actions :update_social_attributes
end