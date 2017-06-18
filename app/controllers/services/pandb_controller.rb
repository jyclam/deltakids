class Services::PandbController < ApplicationController

  def index
    # render json: {hello: 'hihi'}
    category = Category.all
    @services = category[2].services
  end

  def show
    cat = Cat.find params[:id]
    @services = cat.services
  end

end
