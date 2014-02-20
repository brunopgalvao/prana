class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      redirect_to signup_path
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
