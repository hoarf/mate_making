class MateshipsController < ApplicationController

  def create
    @mateship = current_user.mateships.build(:mate_id => params[:mate_id])
    if @mateship.save
      flash[:notice] = "Added mate."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add mate."
      redirect_to root_url
    end
  end

end
