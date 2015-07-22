class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reply
    TextResponse.create!(
      from: params["From"],
      body: params["Body"],
      message_sid: params["MessageSid"],
      account_sid: params["AccountSid"]
      user: User.from_phone(params["From"])
    )
  end
end
