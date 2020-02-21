class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # sorting display

  # GET /items
  # GET /items.json
  def index
    # updating the popularity and availability
    # Item.update_cost
    Item.update_popularity
    Item.update_availability
    # taking the params values and checking
    if params.has_key?(:sort) && params.has_key?(:sort_type)
      @items = Item.order(params[:sort]+" "+params[:sort_type])
    # end
    # checking the search being sent in params
    elsif params.has_key?(:search)
      # getting the items values
      @items = Item.where(params[:search_from] => params[:search])
      if @items.empty?
        @no_result_message = "Sorry. No such results."
      end
    else
      # if no sorting or searching being performed then display the entire list
      @items = Item.all#.order('name')
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
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    # ---------------
    # getting the subscribed users email list
    subscribed_users = Item.check_users
    # if there are any subscribed users then send the mail to them
    if subscribed_users.present?
      # then send the subscribe email to all of them.
      # params[:user] is available in mailer
      UserMailer.with(s_user: subscribed_users).subscribe_email.deliver_now
    end
    # ---------------
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
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
