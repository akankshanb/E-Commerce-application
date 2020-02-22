class SessionsController < Devise::SessionsController
    # prepend_before_action :require_no_authentication, only: [:create ]

    # def new
    #     new_user_session_path
    # end
    
    # def create
    #     super
    # end
end
