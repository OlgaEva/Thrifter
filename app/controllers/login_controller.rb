class LoginController < ApplicationController
    # skip_before_action :authorized, only: [:new, :create]

    def new 

    end

    def create
        @user = User.find_by(user_name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            flash["message"] = "Successfully logged in #{@user.user_name}!"
            session[:user_id] = @user.id 
            redirect_to items_path
        else 
            flash["message"] = "Incorrect Username or Password"
            redirect_to new_login_path
        end
    end

    def destroy
        logout
    end

end
