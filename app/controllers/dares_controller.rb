class DaresController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
      @dare = current_user.dares.build(params[:dare])
      if @dare.save
          flash[:success] = "Dare posted"
          redirect_to root_path
      else
        render 'static_pages/home'
      end
  end

  def destroy
  end
end