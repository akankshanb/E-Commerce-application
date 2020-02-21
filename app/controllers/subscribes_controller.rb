class SubscribesController < ApplicationController
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]
  # setting the item and the user
  before_action :set_item, :set_user

  # commenting out as not required
  # GET /subscribes
  # GET /subscribes.json
  # def index
  #   @subscribes = Subscribe.all
  # end

  # GET /subscribes/1
  # GET /subscribes/1.json
  # def show
  # end

  # GET /subscribes/new
  def new
    # creating a new subscribe and saving it into the table
    @subscribe = Subscribe.new(:item_id => @item.id, :user_id => @user.id)
    respond_to do |format|
      if @subscribe.save
        format.html { redirect_to @item, notice: 'Subscribe was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # # GET /subscribes/1/edit
  # def edit
  # end

  # POST /subscribes
  # POST /subscribes.json
  def create
    @subscribe = Subscribe.new(subscribe_params)
    respond_to do |format|
      if @subscribe.save
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully created.' }
        format.json { render :show, status: :created, location: @subscribe }
      else
        format.html { render :new }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # commenting out as it is not required
  # PATCH/PUT /subscribes/1
  # PATCH/PUT /subscribes/1.json
  # def update
  #   respond_to do |format|
  #     if @subscribe.update(subscribe_params)
  #       format.html { redirect_to @subscribe, notice: 'Subscribe was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @subscribe }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @subscribe.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /subscribes/1
  # DELETE /subscribes/1.json
  def destroy
    @subscribe.destroy
    respond_to do |format|
      format.html { redirect_to subscribes_url, notice: 'Subscribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # setting the user
    def set_user
      @user = current_user
    end

    # setting the current item
    def set_item
      @item = Item.find(params[:item_id])
    end
    # Only allow a list of trusted parameters through.
    def subscribe_params
      params.require(:subscribe).permit(:item_id, :user_id)
    end
end
