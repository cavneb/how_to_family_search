class SessionsController < ApplicationController
  def create
    Rails.logger.info "PARAMS: #{params}"
    user = User.from_omniauth(params)
    session[:user_id] = user.id
    render json: { user_id: user.id }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
