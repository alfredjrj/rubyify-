class ItemOrdersController < ApplicationController


  # def show
  #   # @item_orders = current_order.item_orders
  #   # @order = current_order
  #   render plain: "OK"
  # end
  
  def create
   @store = Store.find(params[:store_id])
   @order = current_order(@store.id)
   @order.store_id = @store.idra
   
   @item = Item.find(params[:item_order][:item_id])
   
   flash.now[:notice] = ["#{@item.name} has been added to your cart " ]
   
    if @order.item_orders.exists?(:item_id=> @item.id )
    else
        @item_order = @order.item_orders.new(item_order_params)
        
         if( Item.find(@item_order.item.id).quantity < @item_order.quantity )
           
            flash.now[:notice] << "not enough in stock"
         end 
            
        @order.total = 0 
     
        @order.item_orders.each do  |item_order|
                 
            @order.total = @order.total + (item_order.item.price * item_order.quantity) 
           
        end  
      
        @order.save
        session[:"order_id#{@store.id}"] = @order.id
        
    end
     
     
     respond_to do |format|
        format.js 
    end
   
   
  end
  
  def update 
     @store = Store.find(params[:store_id])
     @order = current_order(@store.id)
     @order.store_id = @store.id
     @order.total = 0 
     @item_order =   ItemOrder.find(params[:id])
     @item_order.update_attributes(item_order_params)
     
        
       
    
     @order.item_orders.each do  |item_order|
        @order.total = @order.total + (item_order.item.price * item_order.quantity) 
    end  
            
       
   
        
    @order.total= @order.total.round(2)
    @order.save
    
     respond_to do |format|
        format.js 
    end
        
      
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
    params.require(:item_order).permit(:item_id , :quantity  )
  end
  
  
 
end

