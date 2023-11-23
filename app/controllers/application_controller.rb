class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :logged_in?, :authorized

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!Current.user
  end

  def authorized
    unless logged_in?
      flash[:top_alert] = "You need to login first to access personal details."
      redirect_to login_path
    end
  end
end
