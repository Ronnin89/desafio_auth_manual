class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(email: params[:user][:email])
    pass = BCrypt::Password.new(@user.password_digest)

    if @user.present? && pass == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'has iniciado session'
    else
        redirect_to new_user_session_path, notice: 'usuario y/o clave invalido'
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: 'has cerrado la sesion'
  end 

end