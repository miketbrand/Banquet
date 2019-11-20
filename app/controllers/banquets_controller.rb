class BanquetsController < ApplicationController

  def find
    if(session[:user_id])
      user = User.find(session[:user_id])
      zip = user.zip_code
      @banquets = Banquet.where(:zip_code => zip)
    else
      redirect_to login_path
    end
  end

  def show
    if(session[:user_id])
      @banquets = Banquet.where(:hostID => session[:user_id])
    else
      redirect_to login_path
    end
  end

  def create
    if(session[:user_id])
      Banquet.create!(:hostID => session[:user_id], :banquet_name => params[:banquet][:name], :zip_code => params[:banquet][:zip_code], :start => params[:banquet][:start], :end => params[:banquet][:end], :entryPrice => params[:banquet][:entryPrice], :entryLimit => params[:banquet][:entryLimit])
      redirect_to mybanquets_path
    else
      redirect_to login_path
    end
  end
end
