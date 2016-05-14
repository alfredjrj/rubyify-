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
      
       redirect_to  store_path(@store)
      
    
  end 
  
  def show 
       @store = Store.find(params[:store_id])
       @order = current_order(@store.id)
       @order.save
       
       
       
  end 
    
end
