module ApplicationHelper
	def broadcast(channel, &block)	

		message = {:channel=>channel, :data=>capture(&block), :ext=>{:auth_token => FAYE_TOKEN}}
		if Rails.env.production?
			uri = URI.parse("http://#{request.host}/faye")
		else
			uri = URI.parse("http://#{request.host}:9292/faye")
		end
		Net::HTTP.post_form(uri, :message=>message.to_json)
	end

end
