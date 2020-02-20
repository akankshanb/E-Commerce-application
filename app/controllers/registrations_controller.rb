class RegistrationsController < Devise::RegistrationsController
    # before_action :authenticate_user!, only: [:new, :create]
    # skip_before_action :require_no_authentication
    # prepend_before_action :require_no_authentication, only: :cancel

    private

    # def redirect_unless_admin
    #   unless current_user.try(:admin?)
    #     flash[:error] = "Only admins can do that"
    #     redirect_to root_path
    #   end
    # end
  
    # def sign_up(resource_name, resource)
    #   true
    # end
    
    def sign_up_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
  
    def account_update_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
end

