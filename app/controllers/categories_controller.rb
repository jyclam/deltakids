class CategoriesController < ApplicationController

  def index
    @category = Category.find params[:category_id]
    @services = @category.services
  end

end
