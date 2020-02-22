class UserMailer < ApplicationMailer
  # the source mail
  default form: "online.shoppingrails@gmail.com"
  # the subscribe mail
  def subscribe_email
    # the params value has the list of subscribed users emails
    mail(to: params[:s_user], subject: 'Item is available!')
  end
end
