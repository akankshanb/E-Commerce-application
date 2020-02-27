class UserMailer < ApplicationMailer
  # the source mail
  before_action :set_user
  before_action :set_otp
  before_action :set_cart

  default form: "online.shoppingrails@gmail.com"
  # the subscribe mail
  def subscribe_email
    # the params value has the list of subscribed users emails
    mail(to: params[:s_user], subject: 'Item is available!')
  end

  def otp_email
    mail(to: @user.email, subject: 'Your otp is here!')
  end

  # sending purchase details to the user
  def purchase_details
    mail(to: @user.email, subject: 'Thank you for buying!')
  end

  private
  def set_user
    @user = params[:user]
  end
  def set_otp
    @user_otp = params[:otp]
  end

  # to send purchase details to the user
  def set_cart
    @cart = params[:cart]
  end
end
