class WishItemsController < ApplicationController
  include CurrentWishlist
  before_action :set_wish_item, only: [:show, :edit, :update, :destroy]
  before_action :set_wishlist, only: [:create]
  before_action :authenticate_user!

  # GET /wish_items
  # GET /wish_items.json
  def index
    @wish_items = WishItem.all
  end

  # GET /wish_items/1
  # GET /wish_items/1.json
  def show
  end

  # GET /wish_items/new
  def new
    @wish_item = WishItem.new
  end

  # GET /wish_items/1/edit
  def edit
  end

  # POST /wish_items
  # POST /wish_items.json
  def create
    @item = Item.find(params[:item_id])
    @wish_item = @wishlist.add_item(@item)

    respond_to do |format|
      if @wish_item.save
        format.html { redirect_to @wish_item.wishlist}
        format.json { render :show, status: :created, location: @wish_item }
      else
        format.html { render :show }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wish_items/1
  # PATCH/PUT /wish_items/1.json
  def update
    respond_to do |format|
      if @wish_item.update(wish_item_params)
        format.html { redirect_to @wish_item, notice: 'Wish item was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish_item }
      else
        format.html { render :edit }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_items/1
  # DELETE /wish_items/1.json
  def destroy
    @wishlist = Wishlist.find(session[:wish_id])
    @wish_item.destroy
    respond_to do |format|
      format.html { redirect_to wishlist_path(@wishlist), notice: 'Wish item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_item
      @wish_item = WishItem.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def wish_item_params
      params.require(:wish_item).permit(:item_id, :wish_id)
    end
end
