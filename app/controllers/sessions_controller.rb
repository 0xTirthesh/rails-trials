class SessionsController < ApplicationController
  def new
    @page_title = 'Login | Go Getter'
    @page_description = "Login to 'Go Getter' to manage your tasks!"
    @user = User.new
  end

  def create
    puts "attempting login; email: '#{params[:user][:email]}'"

    render plain: '200 Ok', status: :ok
    return

    # session[:user_id] = "1234"
    # redirect_to dashboard_path

    # @user = User.find_by(name: params[:user][:email])
    #
    # if @user && @user.authenticate(params[:user][:password])
    #   puts "login attempt successful; email: '#{params[:user][:email]}'"
    #   session[:user_id] = @user.id
    #   redirect_to dashboard_path
    # else
    #   puts "login attempt failed; email: '#{params[:user][:email]}'"
    #   flash[:alert] = "Login Failed"
    #   redirect_to login_path
    # end
  end

  def destroy
    puts "attempting logout; user id: '#{@user.id}'"

    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
      return
    end

    puts "user logged out; user id: '#{@user.id}'"
    session[:user_id] = nil
    redirect_to login_path
  end
end
