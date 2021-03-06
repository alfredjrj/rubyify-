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
      
      @customer = @store.customers.find_or_create_by(email: params[:email] )
      @order = current_order(@store.id)
      @order.customer =  @customer
    
  
      @order.status = 1 
      @order.save
      session.delete(:"order_id#{@store.id}") 
      
      @order.item_orders.each do |bought_item|
       
         if bought_item.item.inventory == true   
            @item = Item.find(bought_item.item.id)    
            @item.quantity = @item.quantity - bought_item.quantity
            @item.save
         end 
      
      end  
      
      flash[:success] = "Your Order has been placed !"
      redirect_to  store_path(@store)
      
    
  end 
  
  def index
       @store = Store.find(params[:store_id])
       @order = current_order(@store.id)
       @order.save
  end 
    
end
