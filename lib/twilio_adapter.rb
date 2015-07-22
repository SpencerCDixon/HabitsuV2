class TwilioAdapter
  attr_reader :client, :twilio_number
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH'])
    @twilio_number = ENV['TWILIO_NUMBER']
  end

  def send_text(send_number, message)
    client.account.messages.create(
      from: twilio_number,
      to: send_number,
      body: message
      )
  end
end
