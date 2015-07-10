class ArticlesController < ApplicationController
  layout false

  def index
    @page     = params[:page] || 1
  	@klass    = Upmin::Model.find_class('Article')
  	@q 	      = @klass.ransack(params[:q])
    @query    = Upmin::Query.new(@klass, params[:q], page: @page, per_page: @klass.items_per_page)
  end

end
