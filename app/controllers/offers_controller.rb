class OffersController < ApplicationController
  def index
    @offers = Offer.active.displayed
  end
  
  def buy
    @offer = Offer.active.displayed.find(params[:id])
    
    if @offer
      if @offer.buy!(current_user)
        flash[:notice] = "Thank you for your purchase."
      else
        flash[:alert] = "Unable to purchase '#{@offer.name}'."
      end
    else
      flash[:alert] = "Offer does not exist."
    end
    
    redirect_to offers_url
  end
end
