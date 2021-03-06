class UsersController < ApplicationController
    before_action :protect, only: [:index]
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
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to users_admin_index_path, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: users_admin_index_path }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        respond_to do |format|
        if @user.update(account_update_params)
            format.html { redirect_to users_admin_index_path, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: users_admin_index_path }
        else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
        end
    end

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
        params.permit(:name, :phone, :dob, :address, :email, :password, :password_confirmation, :card_name, :card_number, :exp, :cvv)
    end

    def account_update_params
        params.require(:user).permit(:name, :phone, :dob, :address, :email, :card_name, :card_number, :exp, :cvv, :utf8, :_method, :authenticity_token, :user, :commit, :id)
    end

    def protect
        if current_user.admin == false
            redirect_to root_path, notice: "You do not have admin priviledges!"
        end
    end
end
