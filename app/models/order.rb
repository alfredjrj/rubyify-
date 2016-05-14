class Order < ActiveRecord::Base
    has_many :item_orders
    belongs_to :Store
end
