class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def check_user
		if session[:user].present?
			@user = session[:user]
		else
			redirect_to users_path	
		end
	end

end
