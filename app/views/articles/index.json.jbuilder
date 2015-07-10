json.articles do |json|
  json.array!(@query.upmin_results) do |article|
    json.extract! article, :id, :title, :uri, :description, :status, :facebook, :linkedin, :twitter
  end
end