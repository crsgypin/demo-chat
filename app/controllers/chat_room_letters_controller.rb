class ChatRoomLettersController < ApplicationController
	before_action :check_user
	before_action :set_chat_room

	def create
		@letter = @chat_room.letters.new(letter_params)
		@letter.username = @user

		@letter.save!
		broadcast
		render :json => {:result=>"Saved!"}
	end

private
	def set_chat_room
		@chat_room = ChatRoom.find(params[:chat_room_id])	
	end

	def broadcast
		if Rails.env.production?
			uri = URI.parse("#{request.protocol}#{request.host}/faye" )
		else
			uri = URI.parse("#{request.protocol}#{request.host}:9292/faye" )
		end
		message = {:channel=>"/message/#{@chat_room.channel}", 
					 	   :data=>{:content=>@letter.content, :created_at=> @letter.created_at.strftime('%m/%d %X'), :username=> @letter.username},
							 :ext=>{:auth_token => FAYE_TOKEN}}
		Net::HTTP.post_form(uri, :message=>message.to_json)
	end

	def letter_params
		params.require(:letter).permit(:content)
	end

end
