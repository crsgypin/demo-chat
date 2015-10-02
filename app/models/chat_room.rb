class ChatRoom < ActiveRecord::Base
	has_many :letters

	before_save :check_channel
private
	def check_channel
		self.channel = "#{self.name}#{SecureRandom.random_number(1000000)}" unless self.channel.present?
	end			

end
