class MessagesController < ApplicationController

	def index 
		@message = Message.new
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
		params.require(:message).permit(:content)
	end
end
