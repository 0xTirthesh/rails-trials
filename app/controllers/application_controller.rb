class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||=
      begin
        return nil unless session[:user_id]
        User.find(session[:user_id])
      end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
