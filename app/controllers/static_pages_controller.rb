class StaticPagesController < ApplicationController
  def home
     @dare = current_user.dares.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
