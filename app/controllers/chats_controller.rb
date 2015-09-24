class ChatsController < ApplicationController

	def index 
		@chat = Chat.new
		@chats = Chat.all
	end

	def create
		@chat = Chat.new(chat_params)
		@chat.save
		redirect_to chats_path
	end

	def destroy
		@chat = Chat.find(params[:id])
		@chat.destroy
		redirect_to chats_path
	end

private

	def chat_params
		params.require(:chat).permit(:content)
	end

end
