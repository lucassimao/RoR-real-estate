class AuthController < ApplicationController
  def sign_in
    @user = User.new
  end

  def sign_out
  end
end
