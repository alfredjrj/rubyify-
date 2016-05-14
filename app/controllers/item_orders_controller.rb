class ItemOrdersController < ApplicationController

  
  # def show
  #   # @item_orders = current_order.item_orders
  #   # @order = current_order
  #   render plain: "OK"
  # end
  
  def create
   @store = Store.find(params[:store_id])
   @order = current_order(@store.id)
   @order.store_id = @store.id
   
   @item = Item.find(params[:item_order][:item_id])
   
    if @order.item_orders.exists?(:item_id=> @item.id )
    else
        @item_order = @order.item_orders.new(item_order_params)
        @order.total = 0 
     
        @order.item_orders.each do  |item_order|
            @order.total = @order.total + item_order.item.price 
        end  
      
        @order.save
        session[:"order_id#{@store.id}"] = @order.id
    end
    
   
    
     
    redirect_to  store_path(@store)
  end
  
  def destroy
    @store = Store.find(params[:store_id])
    @order = current_order(@store.id)
    @item_order = @order.item_orders.find(params[:id])
    @item_order.destroy
    @order.total = 0 
 
    @order.item_orders.each do  |item_order|
        @order.total = @order.total + item_order.item.price 
    end  
    @order.save 
    redirect_to store_order_path(@store , @order)
  
  end
  
  
  private
  def item_order_params
    params.require(:item_order).permit(:item_id  )
  end
  
  
 
end

