class YogaClassesController < ApplicationController
  authorize_resource
  before_action :signed_in_user,
                only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @yoga_class = YogaClass.all(:order => 'id DESC')
  end
  
  def show
    @yoga_class = YogaClass.find(params[:id])
  end
    
  def new
    @yoga_class = YogaClass.new
  end
  
  def create
    @yoga_class = YogaClass.new(yoga_class_params)
    if @yoga_class.save
      flash[:success] = "Keep it Rollin!"
      redirect_to @yoga_class
    else
      render 'new'
    end
  end
  
  def destroy
    YogaClass.find(params[:id]).destroy
    flash[:success] = "Trashed!"
    redirect_to yoga_classes_path
  end
  
end

private

  def yoga_class_params
    params.require(:yoga_class).permit(:name, :desc, :day, :time, :instructor)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end