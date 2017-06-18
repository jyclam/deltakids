class Services::PandbController < ApplicationController

  def index
    # render json: {hello: 'hihi'}
    category = Category.all
    @services = category[2].services
  end

  def show
    category = Category.all
    cats = category[2].cats
    @cat = cats[params[:id].to_i]
    @services = @cat.services
  end

  def category
      category = Category.all[2]
  end

end
