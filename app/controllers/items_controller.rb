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
  
  def update
  end
  
  def index 
    @store = Store.find(params[:store_id])
      
  end
  
   private
      def item_params
        params.require(:item).permit(:price, :quantity, :name , :rating , :image )
      end
end
