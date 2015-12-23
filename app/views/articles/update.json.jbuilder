json.message @article.errors.try(:full_messages).try(:to_sentence)

json.article do |json|
  json.partial! 'article', article: @article
end
