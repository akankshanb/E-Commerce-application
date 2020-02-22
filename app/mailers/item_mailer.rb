class ItemMailer < ApplicationMailer
  # the source mail
  default form: "online.shoppingrails@gmail.com"
  # the subscribe mail
  def available_email(item, sub_users)
    # # @sub_item =
    # @sub_item = item
    # # puts "---------------"
    # # puts params[:sub_item]
    # puts "--------------"
    # puts @sub_item.name
    # puts "---------------"
    # puts params[:item]
    # puts "-----------------"
    # the params value has the list of subscribed users emails
    mail(to: params[:s_user], subject: 'Item is available!')
    # mail(to: sub_users, subject: 'Item is available!')
  end
end
