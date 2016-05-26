class OrdersController < ApplicationController
  def destroy
      @store = Store.find(params[:store_id])
      # session.delete(:order_id)
      @order = current_order(@store.id)
      @order.destroy
      session.delete(:"order_id#{@store.id}") 
      redirect_to  store_path(@store)
  end


  def create 
      @store = Store.find(params[:store_id])
      @order = current_order(@store.id)
    
      @order.status = 1 
      @order.save
      session.delete(:"order_id#{@store.id}") 
      
       @order.item_orders.each do |bought_item|
     
        
        @item = Item.find(bought_item.item.id)    
        @item.quantity = @item.quantity - bought_item.quantity
        @item.save
        
     
      
       end  
       redirect_to  store_path(@store)
      
    
  end 
  
  def index
       @store = Store.find(params[:store_id])
       @order = current_order(@store.id)
       @order.save
       
       
       
  end 
    
end
