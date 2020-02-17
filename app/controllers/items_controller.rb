class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    # taking the params values and checking
    if params.has_key?(:sort) and params.has_key?(:sort_type)
      @items = Item.order(params[:sort]+" "+params[:sort_type])
    # checking the search being sent in params
    elsif params.has_key?(:search)
      # if the result is not empty
      if not Item.search(params[:search], params[:search_from]).empty?
        @items = Item.search(params[:search], params[:search_from])
        # changing the value to display the table as usual
        @no_result_message = ""
      else
        @no_result_message = "Sorry. No such results."
      end
    # the default is sorted based on the name
    else
      @items = Item.all.order('name')
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
