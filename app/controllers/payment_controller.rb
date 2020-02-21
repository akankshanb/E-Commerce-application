class PaymentController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :create_otp, only: [:send_otp]
  before_action :send_otp, only: [:show, :edit, :update, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @cart = Cart.find(session[:cart_id])
    @user = current_user
    @line_item = LineItem.all
  end

  def verify_otp
    mail_otp = params[:payment][:otp]
    @cart = Cart.find(session[:cart_id])
    @line_item = LineItem.all
    if(mail_otp == session[:current_otp])
      session[:current_otp] = nil
      @line_item.destroy_all
      respond_to do |format|
        format.html { redirect_to cart_path(session_cart), notice: 'Payment was successful' }
      end
    else
      respond_to do |format|
        format.html { redirect_to items_path, notice: 'Payment was unsuccessful' }
      end
    end
  end

  def send_otp
    @user = current_user
    @cart = Cart.find(session[:cart_id])
    @line_item = LineItem.all
    UserMailer.with(user: @user, otp: @user_otp).otp_email.deliver_now
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    # @line_item = @cart.line_items
    @line_item = LineItem.all
  end

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

  def session_cart
    session[:current_cart_id]= Cart.find(session[:cart_id])
  end

end
