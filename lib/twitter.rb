require 'oauth'

module Twitter

  def consumer
    OAuth::Consumer.new(
      NextHoliday::Application.config.twitter_consumer_key,
      NextHoliday::Application.config.twitter_consumer_secret,
      { :site => "https://twitter.com" }
    )   
  end

  def access_token(account)
    OAuth::AccessToken.new(
      consumer,
      account.access_token,
      account.access_verifier
    ) 
  end

  def updateStatus(account, status)
    response = access_token(account).post(
      '/statuses/update.json',
      { :status => status }
    )
   
    case response
    when Net::HTTPSuccess
      Rails.logger.info "Posted"
    else
      Rails.logger.error "Failed to post status"
    end
  end

  module_function :consumer, :access_token, :updateStatus
end
