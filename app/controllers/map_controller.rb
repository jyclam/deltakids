class MapController < ApplicationController

  def index
    @organizations = Organization.take(20)
    @sponsers = Organization.last(5)
  end
end
