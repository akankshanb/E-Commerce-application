class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # @orders = Order.all
    # changing here to be sorted by the id
    order_arelTable = Order.arel_table
    search_user = params[:search_user]
    search_item = params[:search_item]
    # filtering the out the users and items
    if params.has_key?(:search_user) && params.has_key?(:search_item)
      # the name column has the item names for this tableputs search_user
      if search_user.present? && search_item.blank?
        puts "condition 1"
        @orders = Order.where(order_arelTable[:user_name].matches(params[:search_user])).order(:id)
      # elsif params[:search_user].blank? && (!params[:search_item].blank?)
      elsif search_user.blank? && search_item.present?
        puts "condition 2"
        @orders = Order.where(order_arelTable[:name].matches(params[:search_item])).order(:id)
      else
        puts "condition 3"
        @orders = Order.where(order_arelTable[:user_name].matches(params[:search_user])).where(order_arelTable[:name].matches(params[:search_item])).order(:id)
      end
    else
      # if there is no searching requested by the user then complete history is to be shown
      @orders = Order.order(:id)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  # def show
  # end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # updating the order table
  def update_status
    Order.find(params[:id]).update_column('status', params[:status])
    # sending an email to the user of the updated status
    # need the user details, item details and status
    UserMailer.with(order: Order.find(params[:id]), status: params[:status]).updated_status.deliver_now
    # redirecting back to the present orders index
    redirect_back(fallback_location: orders_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:status, :quantity, :price, :user_id, :item_id, :name)
    end
end
