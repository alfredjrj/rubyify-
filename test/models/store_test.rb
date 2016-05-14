require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
   def setup
    @store = Store.new(name: "Example store",  phone: "43434534", address: "34 river rock ave", about:" tell us about your store in a couple of sentences ")
   end
  
  
  test " store should be valid" do
    assert @store.valid?
  end
  
   test " store name should be present" do
    @store.name = "     "
    assert_not @store.valid? , "empty name must be invalid" 
    # checks if it is not valid , if valid it will assert 
  end
  
  test " store name should be unique" do
    duplicate_store = @store.dup
    @store.save
    assert_not duplicate_store.valid?, "store name must be unique"
  end
  
  test "store name should not be longer than 255" do
     @store.name = "a" * 256
     assert_not @store.valid?, "store name longer than 255 must be invalid"
  end 
  
    test "phone should be present" do
    @store.name = "     "
    assert_not @store.valid? , "empty phone must be invalid" 
    # checks if it is not valid , if valid it will assert 
  end
  
  
    test "store address should be present" do
    @store.name = "     "
    assert_not @store.valid? , "empty address must be invalid" 
    # checks if it is not valid , if valid it will assert 
  end
  
  test " phone number can not be longer then 11" do
     @store.phone = "2" * 12
     assert_not @store.valid?, "phone number longer than 11 must be invalid"
     
  end
  
  test " phone number can not be shorter then 7" do
     @store.phone= "1" * 6
     assert_not @store.valid?, "phone number shorter than 7 must be invalid"
     
  end
  
  

  
end
 
   