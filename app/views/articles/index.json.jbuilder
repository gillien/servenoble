json.array!(@articles) do |article|
  json.(article, :id, :title, :uri, :description, :categories, :status, :facebook, :linkedin, :twitter)

  json.source do |json|
    json.logo_thumb article.source.logo.url(:thumb)
  end

end
