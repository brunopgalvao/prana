class YogaClassesController < ApplicationController
  
  authorize_resource
  
  def index
    @yoga_class = YogaClass.all(:order => 'id DESC')
  end
  
  def show
    @yoga_class = YogaClass.find(params[:id])
  end
    
  def new
    @yoga_class = YogaClass.new
  end

end
