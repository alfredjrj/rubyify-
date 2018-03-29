class PagesController < ApplicationController
  def new
  end

  def destroy
  end
# sdf
  def update
      @store = Store.find(params[:store_id])
      @page = @store.pages.find(params[:id])
   
    if @page.update(page_params)
       render 'stores/customize'
    else
      render 'stores/customize'
    end
  end

  def create
    @store = Store.find(params[:store_id])
    @page = @store.pages.create(page_params)
     
    @page.save
    render 'stores/customize'
    
  end
end

private 

      def page_params
        params.require(:page).permit(:name, :template )
      end
      
     
  