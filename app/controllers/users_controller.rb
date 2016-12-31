class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    params.permit!
    @user = User.new do |u|
      u.login = params[:login]
      u.password = params[:password]
      u.fullname = params[:fullname]
      u.phone = params[:phone]
      u.tariff_id = Tariff.find(1).id
      u.balance = 0
      u.is_blocked = false
      u.is_admin = false
    end
    @user.save
    redirect_to login_path
  end

  def home
    @user = User.find(session[:user_id])
    @tariff = Tariff.find(@user.tariff_id)
  end

  def list
    @users = User.all
  end

  def block
    params.permit!
    user = User.find(params[:id])
    user.is_blocked = true
    user.save
    redirect_to users_list_path
  end

  def unblock
    params.permit!
    user = User.find(params[:id])
    user.is_blocked = false
    user.save
    redirect_to users_list_path
  end

  def payment
    params.permit!
    user = User.find(params[:id])
    user.balance -= user.tariff.cost
    user.save
    redirect_to users_list_path
  end

  def change
    @tariffs = Tariff.all
  end

  def change_post
    params.permit!
    user = User.find(session[:user_id])
    user.tariff_id = Tariff.find(params[:id]).id
    user.save
    redirect_to home_path
  end

  def recharge
  end

  def recharge_post
    params.permit!
    user = User.find(session[:user_id])
    user.balance += params[:amount].to_i
    user.save
    BalanceLog.instance.log(user.id, params[:amount].to_i)
    redirect_to home_path
  end
end

class BalanceLog
  @@instance = BalanceLog.new

  def self.instance
    return @@instance
  end

  def log(uid, amount)
    @rec = Recharge.new do |r|
      r.user_id = uid
      r.amount = amount
    end
    @rec.save
  end

  private_class_method :new
end