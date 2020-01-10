class ApplicationController < ActionController::Base

    include AuthHelper
    before_action :authorize

    protected

    def authorize
        unless is_user_authenticated
            redirect_to auth_sign_in_path, message: 'Please log in'
        end
    end

end
