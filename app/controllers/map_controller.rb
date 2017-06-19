class MapController < ApplicationController

  def index
    @organizations1 = Organization.take(7)
    @organizations2 = Organization.offset(7).take(7);
    @sponsers = Organization.last(5)
  end
end
