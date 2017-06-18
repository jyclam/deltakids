class Services::ChildrenController < ApplicationController

  def index
    # render json: {hello: 'hihi'}
    category = Category.all
    @services = category[0].services
  end

end
