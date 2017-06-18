class Learn::ResourcesController < ApplicationController
  def index
    render json: { hello: 'resources' }
	end
end
