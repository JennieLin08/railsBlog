class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update delete ]
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
    
    end

    def create

        @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url(@user), notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    end

   

    def update
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def delete
        @user = User.find(params[:id])
        @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "user was successfully deleted." }
      format.json { head :no_content }
    end
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

        def user_params
        params.require(:user).permit(:name,:username,:email)
        end
end
