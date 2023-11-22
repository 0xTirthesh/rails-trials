class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.

    if session[:user_id] && @current_user.blank?
      logger.debug "#{session[:user_id]}"
      logger.debug "#{@current_user}"

      @current_user = nil

      # @current_user = User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end

    # @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
