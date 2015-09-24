class RealtimeChatController < FayeRails::Controller
  channel '/chat' do
    subscribe do
      Rails.logger.debug "Received on #{channel}: #{inspect}"

      created_at = if message['created_at'].present?
                     Time.parse(message['created_at'])
                   else
                     Time.now
                   end

      Chat.create(content: message['content'])
      # Chat.create(content: "124")
    end
  end
end
