class ApplicationController < ActionController::Base
  
  private
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(access_token:  token).first
    end
  end
end
