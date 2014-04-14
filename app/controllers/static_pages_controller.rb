class StaticPagesController < ApplicationController
  def home
      if signed_in?
       @dare = current_user.dares.build
       @feed_items = current_user.feed.paginate(page: params[:page])
     else
     @feed_items = Dare.paginate(:page => params[:page], :per_page => 30)
     end
  end

  def help
  end

  def about
  end

  def contact
  end
end
