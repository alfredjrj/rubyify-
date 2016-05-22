class ItemsController < ApplicationController
  def create
    
     
    @store = Store.find(params[:store_id])
    @item = @store.items.create(item_params)
     
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
        params.require(:item).permit(:price, :quantity, :name , :rating ,  :description , :image )
      end
end
