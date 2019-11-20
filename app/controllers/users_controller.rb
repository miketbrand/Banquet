class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :zip_code)
  end
  
  def login
    temp = flash[:notice]
    reset_session
    flash[:notice] = temp
  end
  
  def verify
    users = User.where(email: params[:user][:login_email])
    if(users.length < 1)
      flash[:notice] = "Invalid email or password"
      redirect_to login_path
    elsif(users.length == 1)
      if(users[0][:password] == params[:user][:login_password])
        session[:user_id] = users[0][:id]
        redirect_to profile_path
      else
        flash[:notice] = "Invalid email or password"
        redirect_to login_path
      end
    else
      flash[:notice] = "Multiple users with that email. How is that even possible?"
      redirect_to login_path
    end
  end
  
  def create
    if(User.find_by(email: params[:user][:signup_email]))
      flash[:notice] = "A profile already exists with that email address"
      redirect_to login_path
    else
      @user = User.create!(:email => params[:user][:signup_email], :password => params[:user][:signup_password])
      session[:user_id] = @user[:id]
      flash[:notice] = "The new user's id is '#{session[:user_id]}'"
      redirect_to profile_path
    end
  end

  def edit
    if(session[:user_id])
      @user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end

  def update
    if(session[:user_id])
      @user = User.find(session[:user_id])
      @user.update_attributes!(user_params)
      session[:user] = @user
      flash[:notice] = "Profile info was successfully updated."
      redirect_to '/profile'
    else
      redirect_to login_path
    end
  end
end
