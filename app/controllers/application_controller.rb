class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login
  before_action :set_locale

  private

  def require_login
    if logged_in?
      redirect_to login_url
    end
  end

  def logged_in?
    session[:user_id] == nil
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    puts params[:locale]
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end
