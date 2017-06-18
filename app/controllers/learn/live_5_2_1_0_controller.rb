class Learn::Live5210Controller < ApplicationController
  def index
    render json: { hello: 'live5210' }
	end
end
