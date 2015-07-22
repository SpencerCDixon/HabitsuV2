require 'rails_helper'

describe TwilioAdapter do
  describe "#send_text" do
    it "should send api request to twilio to send text" do
      adapter = described_class.new
      VCR.use_cassette("twilio_text") do
        message = adapter.send_text('6178945641', 'testing a text')
        expect(message.status).to eq "queued"
      end
    end
  end
end
