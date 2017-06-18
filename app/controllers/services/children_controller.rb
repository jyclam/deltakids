class Services::ChildrenController < ApplicationController
  before_action :category

  # def index
  #   # render json: {hello: 'hihi'}
  #   category = Category.all
  #   @services = category[0].services
  # end

  def index

    @services = category.services
  end


  def show
    category = Category.all
    cats = category[0].cats
    @cat = cats[params[:id].to_i]
    @services = @cat.services
  end

  private

  def category
      category = Category.all[0]
  end

end
