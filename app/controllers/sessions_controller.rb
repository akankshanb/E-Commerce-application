class SessionsController < Devise::SessionsController
    
    def create
        session[:current_user_id] = current_user.id
        users_path
    end
end
