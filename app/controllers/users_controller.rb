class UsersController < ApplicationController
  authorize_resource
  #before_action :signed_in_user,
                #only: [:index, :edit, :update, :destroy, :following, :followers]
  #before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def instructors
    @users = User.paginate(page: params[:page]).find_all_by_instructor(true)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to PranaOne!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user?(@user)
      render 'edit'
    else
      render 'edit_user'
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user?(@user)
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
          render 'edit'
      end
    else
      if @user.update_attributes(studio_owner_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
          render 'edit_user'
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def new_user_params
      params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    end

    def user_params
      if current_user.admin?
          params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :instructor)
      else
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)  
      end                           
    end
    
    def studio_owner_params
      params.require(:user).permit(:name, :email, :instructor) if current_user.admin?
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
