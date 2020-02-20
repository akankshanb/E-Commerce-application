class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel ]

  protected

  def after_sign_up_path_for(resource)
    '/users/index'
  end

  private

    def sign_up_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
  
    def account_update_params
      params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
end

