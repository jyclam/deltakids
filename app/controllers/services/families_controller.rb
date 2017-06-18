class Services::FamiliesController < ApplicationController

  def index
    # render json: {hello: 'hihi'}
    category = Category.all
    @services = category[1].services
  end

end
