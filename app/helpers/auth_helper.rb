module AuthHelper
    def is_user_authenticated
        return session[:user_id] != nil
    end

    def authenticated_user
        return User.find_by(id: session[:user_id])
    end
end
