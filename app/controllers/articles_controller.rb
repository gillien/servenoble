class ArticlesController < ApplicationController
  layout false

  before_action :authenticate_user!

  def index
    @query     = Article.search(search_params)
    @articles	 = @query.page(params[:page] || 0)
  end

  def search_params
    params.permit(:status, :keywords, :source_id)
  end
end
