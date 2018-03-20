module ItemsHelper
    
   def max_value(item)
      if item.quantity == 0
          return 100
      else
          return item.quantity
      end 
     
   end 
   
end
