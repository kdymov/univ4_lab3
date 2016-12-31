class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    params.permit!
    @user = User.find_by_login(params[:login])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      logger.info "#{@user.login} successfully logged in!"
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end
end
