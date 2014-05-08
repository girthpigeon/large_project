class DaresController < ApplicationController
    before_filter :signed_in_user, only: [:create, :destroy, :accept]

  def create
      @dare = current_user.dares.build(params[:dare])
      if @dare.save
          flash[:success] = "Dare posted"
          redirect_to root_path
      else
      flash[:error] = "Error: Dare not posted"
        render 'static_pages/home'
      end
  end
  
  def accept
      @dare = Dare.find(params[:id])
      if @dare.update_attribute(:accepted, "true")
          flash[:success] = "Dare accepted"
          redirect_to root_path
      else
        flash[:failure] = "Dare already accepted by someone else"
      end
    end

  def destroy
  end
end