class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by_email (params[:session][:email].downcase)
  if user and user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:notice] = "Loged in successfully"
    redirect_to user
  else
    flash.now[:alert] = "There was something wrong your credentials"
    render 'new'

  end
end

def destroy
  session[:user_id] = nil
  flash[:notice] = "Logged out successfully"
  redirect_to root_path
  
end

end