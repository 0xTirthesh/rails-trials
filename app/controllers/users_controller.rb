# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:dashboard, :settings, :update_password]

  def create
    @user = User.new
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]

    if @user.save
      flash[:top_notice] = "User created successfully; now login"
      redirect_to login_path
    else
      flash[:top_alert] = "User creation failed; please fix errors and retry"
      redirect_to root_path
    end
  end

  def dashboard
    @page_title = 'Dashboard | Go Getter'
    display_name = Current.user.display_name.blank? ? Current.user.email : Current.user.display_name
    flash.now[:btm_notice] = "Welcome Back, #{display_name}!"
  end

  def settings
    @page_title = 'Settings | Go Getter'
    puts "showing settings; user id: '#{Current.user.id}'"
    @user = User.new
  end

  def update_password
    @user = User.find_by(id: Current.user.id)
    if @user.update(password: password_params[:password], password_confirmation: password_params[:password_confirmation])
      flash[:top_notice] = "Password updated successfully"
      redirect_to dashboard_path
    else
      flash[:top_alert] = "Password update failed"
      redirect_to settings_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end