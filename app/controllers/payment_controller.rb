class PaymentController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @cart = Cart.find(session[:cart_id])
    # @user = User.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end
end
