class SessionsController < ApplicationController
  #before_action :authorized, only: [:new, :create]

  def new
    @page_title = 'Login | Go Getter'
    @page_description = "Login to 'Go Getter' to manage your tasks!"
    @user = User.new
  end

  def create
    puts "attempting login; email: '#{params[:user][:email]}'"
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      puts "login attempt successful; email: '#{params[:user][:email]}'"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      puts "login attempt failed; email: '#{params[:user][:email]}'"
      flash[:alert] = "Login Failed"
      redirect_to login_path
    end
  end

  def destroy
    puts "attempting logout; user id: '#{current_user.id}'"

    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
      return
    end

    puts "user logged out; user id: '#{current_user.id}'"
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
