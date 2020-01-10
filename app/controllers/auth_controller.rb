class AuthController < ApplicationController

  def sign_in

    if request.post?
        user = User.find_by(login: params[:login])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
            @message = 'Invalid username or password'
        end
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to '/'
  end
end
