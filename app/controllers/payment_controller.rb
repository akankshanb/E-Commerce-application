class PaymentController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :create_otp, only: [:send_otp]
  before_action :send_otp, only: [:show, :edit, :update, :destroy]
  # before_action :set_line_item

  def index
    @cart = Cart.find(session[:cart_id])
    @user = current_user
    puts "Abhi YE hai cart id"
    puts @cart
  end

  def verify_otp
    mail_otp = params[:payment][:otp]
      # puts "Purana wala===>>>"
      # puts  @mail_otp
    if mail_otp == session[:current_otp]
      session[:current_otp] = nil
      respond_to do |format|
        format.html { redirect_to cart_path(@cart), notice: 'Payment was successful' }
      end
    end


  end

  def send_otp
    @user = current_user
    UserMailer.with(user: @user, otp: @user_otp).otp_email.deliver_now
  end

  def show

  end

  # def send_otp_post
  #   mail_otp = params[:otp]
  #   puts "===>>>"
  #   puts mail_otp
  #   respond_to do |format|
  #     if(mail_otp == @user_otp)
  #       format.html { redirect_to payment_path, notice: 'Payment was successful' }
  #       # format.json { render :show, status: :created, location: @line_item }
  #     else
  #       format.html {redirect_to items_path, notice: 'Payment unsuccessful' }
  #     end
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def set_user
    @user = current_user
  end

  def create_otp
    @user_otp = (0...8).map { (65 + rand(26)).chr }.join
    session[:current_otp] = @user_otp
  end

end
