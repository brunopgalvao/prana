class YogaClassesController < ApplicationController
  authorize_resource
  before_action :signed_in_user,
                only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @yoga_class = YogaClass.all(:order => 'Day')
    # not working with pg @yoga_class = YogaClass.all (:order => 'CASE Day WHEN "Monday" THEN 1 WHEN "Tuesday" THEN 2 WHEN "Wednesday" THEN 3 WHEN "Thursday" THEN 4 WHEN "Friday" THEN 5 WHEN "Saturday" THEN 6 WHEN "Sunday" THEN 7 END')
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
      flash[:success] = "Class added!"
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