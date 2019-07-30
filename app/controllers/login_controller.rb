class LoginController < ApplicationController

    def new 

    end

    def create
        @user = User.find_by(user_name: params[:user_name])
        # @user.authenticate(params[:password])
    end

end
