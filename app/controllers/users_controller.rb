# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    puts "adding new create user"

    @user = User.new
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]

    if @user.save
      flash[:top_notice] = "User created successfully"
      redirect_to login_path
    else

      puts "-------------------------"
      @user.errors.full_messages.each { |err|
        puts "#{err}"
      }
      puts "-------------------------"

      flash[:top_alert] = "User not created"
      redirect_to root_path
    end
  end

  def dashboard
    @page_title = 'Dashboard | Go Getter'
    puts "showing dashboard; user id: '#{@user.id}'"

    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
      return
    end

    flash.now[:btm_notice] = "Welcome Back, #{@user.display_name}!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end