class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  
 helper_method :current_order

  def current_order(store_id)
    if !session[:"order_id#{store_id}"].nil?  && Order.where(id: session[:"order_id#{store_id}"]).exists?
      Order.find(session[:"order_id#{store_id}"])
      # if cant find it create a new order  
    
    else
      @order = Order.new
      # session[:"order_id#{@store.id}"] = @order.id
    end
  end
  
end


