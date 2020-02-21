class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy, :update]
    
    # GET /users
    # GET /users.json
    def index
        @users = User.all
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    # def new
    #     @user = User.new
    # end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    # def create
    #     if user_signed_in? and current_user.admin?
    #         @temp = current_user
    #         logger.debug "old admin: #{@temp.attributes.inspect}"
    #     end
    #     @user = User.new(user_params)
    #     respond_to do |format|
    #         if @user.save
    #             format.html { redirect_to @temp, notice: 'User was successfully created.' }
    #             format.json { render :show, status: :created, location: @temp }
    #             logger.debug "New user: #{@user.attributes.inspect}"
    #         else
    #             format.html { render :new }
    #             format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    # def update
    #     respond_to do |format|
    #     if @user.update(user_params)
    #         format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #         format.json { render :show, status: :ok, location: @user }
    #     else
    #         format.html { render :edit }
    #         format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    #     end
    # end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
        format.html { redirect_to users_admin_index_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
        end
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end
end
