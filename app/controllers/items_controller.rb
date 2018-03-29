class ItemsController < ApplicationController
    
 before_action :logged_in_user, only: [:create,   :edit ,:destroy , :update  , :index]
 before_action :correct_user_item, only: [:create,  :edit ,:destroy , :update , :index ]
  
  def create
    @store = Store.find(params[:store_id])
    @item = @store.items.create(item_params)
    
    if @item.inventory == false 
      @item.quantity = 0 
    end 
    
    @item.save
    render 'show'
    # redirect_to action: "show", id: @item.id
  end

  def destroy
    @store = Store.find(params[:store_id])
    Item.find(params[:id]).destroy
    flash[:success] = "item deleted"
    render "stores/show"
  end
  
  def edit 
     @store = Store.find(params[:store_id])
     @item =  Item.find(params[:id])
  end 
  
  def update
    
    @store = Store.find(params[:store_id])
    @item = Item.find(params[:id]) 
    
    if @item.update_attributes(item_params)
      if @item.inventory == false
        @item.quantity = 0 
        @item.save
      end 
     render 'show'
    else 
      render 'edit'
    end 
  end 
  
  def index 
    @store = Store.find(params[:store_id])
  end
  
   private
      def item_params
        params.require(:item).permit(:price, :quantity, :name , :rating,  :description, :image, :inventory)
      end
      
      def correct_user_item
         @store = Store.find(params[:store_id])
         if @store.user != current_user
            flash[:danger] = "Please login to view."
            redirect_to root_url
         end
      end
         
end
