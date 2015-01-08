class MicropostsController < ApplicationController
  before_action :signed_in_user
  
  def create
    @micropost = current_user.microposts.build(params.require(:micropost).permit(:content))
    if @micropost.save
      flash[:success] = "Micropost created."
      redirect_to chat_path
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def destroy
    
  end
  
end
