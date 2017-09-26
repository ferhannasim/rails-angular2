class ApplicationController < ActionController::Base
  
  private
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.where(access_token:  token)if User.exists?(access_token:  token)

    end
  end
end
