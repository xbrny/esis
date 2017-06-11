class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(student_id: params[:session][:student_id].upcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Invalid ID/Password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
