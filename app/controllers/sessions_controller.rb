class SessionsController < ApplicationController
  def new
  end

  def index
    redirect_to root_url
  end

  def create
    @user = User.find_by_username(params[:username].strip)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:notice] = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

end
