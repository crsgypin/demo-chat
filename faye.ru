require 'faye'
require File.expand_path('../config/initializers/faye_token.rb', __FILE__)

class ServerAuth
	def incoming(message, callback)
		puts "time: #{Time.now} message:#{message}"
		if message['channel'] !~ %r{^/meta/}
			if !message['ext'] || message['ext']['auth_token'] != FAYE_TOKEN
				message['error'] = "invalid authentication token"
			end
		end
		callback.call(message)
	end
end

faye_server = Faye::RackAdapter.new(:mount=> '/faye', :timeout => 45)
Faye::WebSocket.load_adapter('thin')
faye_server.add_extension(ServerAuth.new)
run faye_server

