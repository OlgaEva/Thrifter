class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:new, :create]
    def index
        @users = User.all 
    end

    def show
        find_user
    end

    def new 
        @user = User.new 
    end

    def create 
        @user = User.creat(user_params)
        if @user.valid?
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path 
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to edit_user_path 
        end
    end

    def destroy
        find_user
        @user.destroy
        redirect_to root_path 
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
