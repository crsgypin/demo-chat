class UsersController < ApplicationController

	def create 
		session[:user] = params[:user]
		redirect_to chat_rooms_path
	end

	def destroy 
		session[:user] = nil
		redirect_to users_path
	end


end
