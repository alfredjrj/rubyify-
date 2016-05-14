class Item < ActiveRecord::Base
   belongs_to :Store
   has_many :item_orders
   validates :name, presence: true
    validates :price, presence: true
    
       has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" },
     :default_url => "/assets/blankitem.jpg"
    
     validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
     
end

Item.class_eval do
  def to_liquid
      {
    'name'=>self.name,
    'price'=>self.price,
    'image_lg'=> self.image.url(:large),
    'image_med'=> self.image.url(:med)
  }
  end
end
