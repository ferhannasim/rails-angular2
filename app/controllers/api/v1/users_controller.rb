class Api::V1::UsersController < ApplicationController
  
  def create
    user=User.find_by_email(params[:profileData][:email])
    if user.present?
      user.access_token=params[:user][:accessToken]
      user.expiry_time = Time.at(params[:user][:expiryTime])
    else
      user             =User.new
      user.access_token=params[:user][:accessToken]
      user.expiry_time = Time.at(params[:user][:expiryTime])

      user.uid         =params[:profileData][:uid]
      user.email       = params[:profileData][:email]
      user.name        =params[:profileData][:name]
    end
    if user.save!
      resp_data    = user
      resp_status  = 200
      resp_message = 'user is  saved successfully'
      resp_errors  = ''
    else
      resp_data    = ''
      resp_status  = 400
      resp_message = 'User not found'
      resp_errors  = user.errors.full_messages
    
    
    end
    common_api_response(resp_data, resp_status, resp_message, resp_errors)
  end
  


end
