class Admin::BaseController < ApplicationController
  before_action :authenticate_org!
  before_action :authorize_admin

  private
  
  def authorize_admin
	head :unauthorized unless current_org.is_admin? 
  end

end
