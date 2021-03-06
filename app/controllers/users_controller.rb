class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}"
        redirect_to 'root_path'
      else
        flash[:warning] = "Ivalid Email or Password"
        redirect_to 'root_path'
      end 
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end
  end