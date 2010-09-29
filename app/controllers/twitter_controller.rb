class TwitterController < ApplicationController

  def index
    if Account.count == 0
      request_token = Twitter.consumer.get_request_token(
        :oauth_callback => "http://#{request.host_with_port}/callback"
      )

      session[:request_token] = request_token.token
      session[:request_token_secret] = request_token.secret

      redirect_to request_token.authorize_url
      return
    end

    redirect_to root_path
  end

  def show
    request_token = OAuth::RequestToken.new(
      Twitter.consumer,
      session[:request_token],
      session[:request_token_secret]
    )

    session[:request_token] = nil
    session[:request_token_secret] = nil

    if params[:denied]
      redirect_to root_path
      return
    end

    access_token = request_token.get_access_token(
      {},
      :oauth_token => params[:oauth_token],
      :oauth_verifier => params[:oauth_verifier]
    )

    response = Twitter.consumer.request(
      :get,
      '/account/verify_credentials.json',
      access_token,
      { :scheme => :query_string }
    )

    case response
    when Net::HTTPSuccess
      user_info = JSON.parse(response.body)
      unless user_info['id']
        logger.error "Authentication failed"
        redirect_to root_path
        return
      end
    else
      logger.error "Failed to get account info via OAuth"
      redirect_to root_path
      return
    end

    account = Account.new(
      :twitter_id => user_info['id'],
      :access_token => access_token.token,
      :access_verifier => access_token.secret
    )

    if account.save
      logger.info "Saved account info via OAuth"
    else
      logger.error "Failed to save account info via OAuth"
    end

    redirect_to root_path
  end
end
