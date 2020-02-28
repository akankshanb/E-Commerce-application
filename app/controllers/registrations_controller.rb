class RegistrationsController < Devise::RegistrationsController
  private

    def sign_up_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
  
    def account_update_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :current_password, :card_name, :card_number, :exp, :cvv)
    end

    protected

    def update_resource(resource, params)
      resource.update_with_password(params)
    end
end

