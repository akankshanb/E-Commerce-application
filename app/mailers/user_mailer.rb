class UserMailer < ApplicationMailer
  before_action :set_user
  before_action :set_otp
  default from: 'online_shopping@example.com'

  def otp_email
    mail(to: @user.email, subject: 'Your otp is here!')
  end

  private
    def set_user
      @user = params[:user]
    end
  def set_otp
    @user_otp = params[:otp]
  end
end
