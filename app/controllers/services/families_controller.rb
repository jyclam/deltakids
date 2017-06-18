class Services::FamiliesController < ApplicationController

  def index
    # render json: {hello: 'hihi'}
    category = Category.all
    @services = category[1].services
  end

  def show
    category = Category.all
    cats = category[1].cats
    # @cat = cats.find params[:id]
    @cat = cats[params[:id].to_i]
    @services = @cat.services
  end

end
