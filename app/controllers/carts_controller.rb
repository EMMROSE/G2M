class CartsController < ApplicationController
  def devis
    # prepare email and forward csv as argument
    authorize @current_cart
    ProposalMailer.devis(@current_cart).deliver_now
    @current_cart.items.destroy_all
    redirect_to root_path
    flash[:notice] = "Votre devis vous a été expédié."
  end
end
