require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  message.reply(text: 'Hello!')

  Bot.deliver({
    recipient: message.sender,
    message: {
      text: message.text
    }
  }, access_token: ENV["ACCESS_TOKEN"])
end
