class Order < ActiveRecord::Base
    has_many :item_orders ,dependent: :destroy 
    belongs_to :Store
end
