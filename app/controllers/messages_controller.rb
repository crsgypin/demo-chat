class MessagesController < ApplicationController

	def index 
		@message = Message.new
		@messages = Message.all
	end

	def create
		@message = Message.new(message_params)
		@message.save
		redirect_to messages_path
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to messages_path
	end

private

	def message_params
		params.require(:message).permit(:content)
	end


end
