class StoresController < ApplicationController
  
  def create
     @user = User.find(params[:user_id])
 
     @store = @user.Store.new(store_params)
     
     @store.save
     redirect_to action: "show", id: @store.id
  
  end
  
  def show
      @store = Store.find(params[:id])
      
  end

  def destroy
  end

  def update
  end
  
  def index
  end
  
  
  private
      def store_params
        params.require(:store).permit(:name, :address, :phone , :about )
      end

end
