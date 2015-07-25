class ArticlesController < ApplicationController
  layout false

  before_action :authenticate_user!

  def index
    @query     = Article.search(params[:q])
    @articles	 = @query.page(params[:page])
  end
end
