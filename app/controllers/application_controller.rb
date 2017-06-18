class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def org_signed_in?
	if session[:org_id].present? && current_org.nil? 
	  session[:org_id] = nil 
	end
	session[:org_id].present? 
  end

  helper_method :org_signed_in?

  def current_org
	@organization ||= Organization.find_by(id: session[:org_id]) 
  end

  helper_method :current_org

  def authenticate_org!
	if !org_signed_in? 
	  redirect_to new_session_path 
	end
  end




end
