class Services::PandbController < ApplicationController

  def index
    category = Category.all
    @services = category[2].services
  end

  def show
    category = Category.all
    cats = category[2].cats
    @cat = cats[params[:id].to_i]
    @services = @cat.services
  end

end
