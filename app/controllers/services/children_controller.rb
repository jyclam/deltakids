class Services::ChildrenController < ApplicationController

  def index
    # category = Category.all
    # @services = category[0].services
    @services = Category.first.services
  end

  def show
    # category = Category.all
    # cats = category[0].cats
    cats = Category.first.cats
    services = Category.first.services
    @cat = cats[params[:id].to_i]
    @services = @cat.services
    @services = services.where({cat: params[:id].to_i})
  end


end
