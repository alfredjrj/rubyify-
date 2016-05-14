class StoresController < ApplicationController
  
 before_action :logged_in_user, only: [:create, :customize,  :new ]
 before_action :correct_user, only: [:create, :customize,  :new ]

  def create
      @user =current_user
      @store = current_user.stores.build(store_params)
     #create pages for store  home , about , item
   
    if @store.save
      
      default_aboutpage(@store)
      default_homepage(@store)
       
      flash[:success] = "your store has been created!"
      render "stores/customize"
       
    else
      
      render "stores/new"
    end
  end

  
  def show
      @user= current_user
      @store = Store.find(params[:id])
      @pages =  @store.pages
      
    

  end
  
  def customize 
    
     @user = current_user
     @store = Store.find(params[:id])
    # @page =  Page.find(params[:id])
  end 
  
  
  
  def additem
    
      @user = current_user
     @store = Store.find(params[:id])
    
  end
  
  
  
  def try
    @user= current_user
    @store = Store.find(params[:id])
    
    

   
  # @template = Liquid::Template.parse("{{ store.name }}")
  # @template.render('store.name' => @store.name)     

  end
    

    
  def home
 
      @store = Store.find(params[:id])
      @page =  @store.pages.where(:name => 'home')
      
    
  end 
  
  def about
    
      @store = Store.find(params[:id])
      # @page =  @store.pages
      # @page = Page.where(:name => "About" , :store_id => @store.id)
      @page = @store.pages.find_by(name: 'About' )

      render :text => @page.template
    
  end 
  
  
  
  def new
     @user =  current_user   
     @store = Store.new()

  end 
  
  def edit
    @store = Store.find(params[:id])
    @user =  current_user   
    
    
  end
  
  def update
    @store = Store.find(params[:id])
    @user =  current_user   
 
    if @store.update(store_params)
      redirect_to @user
    else
      render 'edit'
    end
    
  end 

  def destroy
    @store = Store.find(params[:id])
    @store.delete
    redirect_to user_path
  end

  
  
  def index
     @stores = Store.all
  end

  
  
  private
      def store_params
        params.require(:store).permit(:name, :address, :phone , :about,  :image )
      end
      
    

      def all_stores
        @stores =  Store.all
        return @stores
      end
      
       def default_homepage(store)
        
        store.pages.create( name: "Home", template: %{
        
          
        {% for item in store.items %} 
          <img  src= "{{item.image_lg}}"> </img>
          <li>{{ item.name }}
          {{ item.price }}</li>
        {% endfor %}
         
        }
        )

       end
      
      def default_aboutpage(store)
        
        store.pages.create(name: "About", template: %{
           <h1> Hello {{ store.name }} </h1>
            
            We are located on {{ store.address }}.
            
            <h1>  Here is why we are different </h1>
               {{ store.about }}
          }
          )
        
      end
      
      
      def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
      end
      
      def correct_user
        @user = User.find(params[:user_id])
        redirect_to(root_url) unless @user == current_user
        
      end
end
