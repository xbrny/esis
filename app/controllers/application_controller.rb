class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:warning] = "The action/page you requested can only be accessed by logged in user"
      redirect_to root_path
    end
  end

  def require_admin
    if !logged_in? || !current_user.admin?
      flash[:warning] = "The action/page you requested can only be accessed by admin"
      redirect_to root_path
    end
  end
end
