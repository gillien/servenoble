##
# Controller for articles.
class ArticlesController < ApplicationController
  layout false

  def index
    @query     = Article.search(search_params).includes(:source)
    @articles	 = @query.page(params[:page] || 0).per(10)
  end

  def update
    article.update_attributes(article_params)
  end

  private

  def article_params
    params.permit(:status, :is_read, :is_archived)
  end

  def search_params
    params.permit(
      :status, :keywords, :source_id, :facebook_gt, :facebook_lt, :linkedin_gt,
      :facebook_lt, :twitter_gt, :twitter_lt)
  end

  def article
    @article ||= Article.find(params[:id])
  end
end
