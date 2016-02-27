json.array!(@articles) do |article|
  json.extract!(article, :id, :title, :uri, :description, :is_read, :categories, :status)
  json.extract!(article, :facebook, :linkedin, :twitter)

  json.source do |json|
    json.logo_thumb article.source.logo.url(:thumb)
  end
end
