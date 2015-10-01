class MessagesController < ApplicationController
	before_action :check_user

	def index 
		@message = Message.new(:username=>@user)
		@messages = Message.last(15)
	end

	def create
		@message = Message.new(message_params)
		@message.save
		respond_to do |format|
			format.html {redirect_to messages_path}
			format.js
		end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		respond_to do |format|
			format.js
			format.json {render :json=>{:result=>"ok"}}
		end
	end

private

	def message_params
		params.require(:message).permit(:content, :username)
	end

	def check_user
		if session[:user].present?
			@user = session[:user]
		else
			redirect_to users_path	
		end
	end

end
