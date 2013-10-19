class OffersController < ApplicationController
  def index
    @offers = Offer.active.displayed
  end
  
  def buy
    @offer = Offer.active.find(params[:id])
    
    if @offer
      if @offer.buy!(current_user)
        flash[:notice] = "Thank you for your #{@offer.free? ? 'redemption' : 'purchase'} of the '#{@offer.name}'."
      else
        flash[:alert] = "Unable to purchase '#{@offer.name}'."
      end
    else
      flash[:alert] = "Offer does not exist."
    end
    
    redirect_to offers_url
  end
  
  def show
    @offer = Offer.active.find_by_name(params[:id])
    
    if @offer.nil?
      redirect_to offers_url, :alert => "Promo code '#{params[:id]}' not found."
    end
  end
end
