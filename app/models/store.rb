class Store < ActiveRecord::Base 
    belongs_to :user
    has_many :items, dependent: :destroy
    has_many :links, dependent: :destroy  
    has_many :pages, dependent: :destroy 
    has_many :orders, dependent: :destroy 
    
     validates :name, presence: true ,  length: { maximum: 255} , uniqueness: true
     validates :phone, presence: true ,  length: { maximum: 9 , minimum: 7 }
     validates :address, presence: true
     validates :about, presence: true
     has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" , background: "1100x500!" },
     :default_url => "/assets/missing_shop.png"
    
     validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
     
   # liquid_attributes << :name << :address 
   
#     liquid_methods :name
   
#   def name
   
#         user.name
     
#   end

    #  def to_liquid
    #   self.name
    #  end
end




 
Store.class_eval do
  def to_liquid
      {
    'name'=>self.name,
    'address'=>self.address,
    'about'=>self.about,
    "items"=> self.items,
  }
  end
  
  def polaroid(image)
      
  "  <div>
      <img  src='#{image}'> jhl jlkljl </img>
  </div> "
    
  end 
end