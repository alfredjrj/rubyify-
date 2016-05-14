class SessionsController < ApplicationController
  def new
  end
  
  def destroy
    log_out
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end
  
  
  def create
    
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       log_in user
       redirect_to user
     
    else
      flash[:success] = 'Invalid email password combination'
      redirect_to root_url
     
    end
  end
  
  
end
