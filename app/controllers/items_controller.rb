class ItemsController < ApplicationController
  include CurrentCart
  include CurrentWishlist
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_cart, except: [:create, :new, :update]
  before_action :set_wishlist, except: [:create, :new, :update]

  # GET /items
  # GET /items.json
  def index
    # getting the subscribed users email list
    # has to be in the index as we have availability is updated with quantity
    if not Item.first.nil?
      # updating the popularity and availability
      Item.update_popularity
      Item.update_availability
      subscribed_users = Item.check_users
    end
    # if there are any subscribed users then send the mail to them
    if subscribed_users.present?
      # then send the subscribe email to all of them
      UserMailer.with(s_user: subscribed_users).subscribe_email.deliver_now
    end

    # taking the params values and checking
    if params.has_key?(:sort) && params.has_key?(:sort_type)
      @items = Item.order(params[:sort]+" "+params[:sort_type])
    # checking the search being sent in params
    elsif params.has_key?(:search)
      # these two lines can be used for case sensitive search
      item_arelTable = Item.arel_table
      @items = Item.where(item_arelTable[params[:search_from]].matches(params[:search]))
      if @items.empty?
        @no_result_message = "Sorry. No such results."
      end
    else
      # if no sorting or searching being performed then display the entire list
      @items = Item.all
      # making it again empty
      @no_result_message = ""
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @reviews = Review.where(item_id: @item.id).order("created_at DESC")
    # the average of the ratings to be shown in the show
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: items_path }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
      Item.update_tax(@item)
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: items_path }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:brand, :name, :category, :quantity, :cost, :purchases, :available, :special, :restricted, :age_restricted, :image, :sort, :sort_type, :search, :search_from)
    end
end
