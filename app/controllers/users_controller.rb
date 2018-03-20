class UsersController < ApplicationController
   before_action :logged_in_user, only: [  :show ]
  
  
  def create
    @user = User.new(users_params) 
    if @user.save
       log_in @user
       flash[:success] = "Welcome to rubify! create your store"
       redirect_to new_user_store_path(@user)
    else
      render "welcome/main"
    end
  end
  
  
  def show
      @user = current_user
      @stores = @user.stores
  end
  
   
  def destroy
  end
  
  
  
private
      def users_params
        params.require(:user).permit(:name,  :email,  :password, :password_confirmation)
      end

      
      # def logged_in_user
      # unless logged_in?
      #   flash[:danger] = "Please log in."
      #   redirect_to root_url
      # end
      # end
      
      # def correct_user
      # @user = User.find(params[:id])
      # redirect_to(root_url) unless @user == current_user
      # end
 
   
end

