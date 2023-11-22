# frozen_string_literal: true

class UsersController < ApplicationController

  def create
    puts "adding new create user"

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
    @user = current_user

    puts "showing dashboard; user id: '#{@user.id}'"

    unless logged_in?
      flash[:top_alert] = "You need to login first to access the dashboard"
      redirect_to login_path
    end

    display_name = @user.display_name.blank? ? @user.email : @user.display_name
    flash.now[:btm_notice] = "Welcome Back, #{display_name}!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end