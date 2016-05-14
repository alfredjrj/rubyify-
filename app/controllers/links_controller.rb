class LinksController < ApplicationController
  
      
 before_action :logged_in_user, only: [:create ]

  def create
    @store = Store.find(params[:store_id])
    @link = @store.links.create(link_params)
    @link.save
    
    render "stores/customize"
  
  end 
  
  
  
end


private

  def link_params
      params.require(:link).permit(:link )
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end
      
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
    
  end