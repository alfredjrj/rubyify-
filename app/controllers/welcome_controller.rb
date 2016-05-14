class WelcomeController < ApplicationController
  
  def main
    
    if current_user
      redirect_to current_user
      
    else
      @user = User.new
    end
     
  end
  
  
  
end
