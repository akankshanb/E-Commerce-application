class UserMailer < ApplicationMailer
  # the source mail
  default form: "online.shoppingrails@gmail.com"
  # the subscribe mail
  def subscribe_email
    puts "----------------------------"
    puts params[:s_user]
    mail(to: params[:s_user], subject: 'Test Mail works!')
    mail(to: 'santoshpavan.psp@gmail.com', subject: 'Standard Mail!')
  end
end
