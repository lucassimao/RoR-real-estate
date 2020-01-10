class AuthController < ApplicationController

  skip_before_action :authorize

  def sign_in

    if request.post?
        user = User.find_by(login: params[:login])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_url
        else
            @message = 'Invalid username or password'
        end
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_url
  end
end
