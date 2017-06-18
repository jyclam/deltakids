class Services::ChildrenController < ApplicationController

  def index
    category = Category.all
    @services = category[0].services
  end

  def show
    category = Category.all
    cats = category[0].cats
    @cat = cats[params[:id].to_i]
    @services = @cat.services
  end


end
