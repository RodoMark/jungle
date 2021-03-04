class UsersController < ApplicationController
  def new
  end

  def do_register
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/register'
    end
  end

  def do_login
    user = User.find_by_email(user_params[:email])
    p user
    p params[:password] 
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
