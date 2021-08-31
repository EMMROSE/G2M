class PaiementsController < ApplicationController
  require 'date'

  def index
    @paiements = Paiement.all
  end

  def show
  end

  def new
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @paiement = Paiement.new
    authorize @paiement
  end

  def create
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @paiement = Paiement.new
    authorize @paiement
    @paiement.date = Date.today
    @paiement.fournisseur = @fournisseur
    # previous_paiements = 0
    # Paiement.where(fournisseur_id: @fournisseur.id).each do |paiement|
    #   previous_paiements += paiement.amount_cents.to_f
    # end
    @paiement.amount_cents = @paiement.fournisseur.credit
    @paiement.save
    ProposalMailer.paiement(@paiement).deliver_now
    flash[:notice] = "Votre demande a bien été enregistrée. Le virement sera effectué à la fin du mois."
    redirect_to root_path
  end

  def avoir
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @paiement = Paiement.new
    authorize @paiement
    @paiement.date = Date.today
    @paiement.fournisseur = @fournisseur
    # previous_paiements = 0
    # Paiement.where(fournisseur_id: @fournisseur.id).each do |paiement|
    #   previous_paiements += paiement.amount_cents.to_f
    # end
    @paiement.amount_cents = @paiement.fournisseur.credit
    @paiement.avoir = true
    @paiement.save
    redirect_to edit_amount_path(@paiement)
  end

  def edit
    @paiement = Paiement.find(params[:id])
    authorize @paiement
  end

  def update
    @paiement = Paiement.find(params[:id])
    authorize @paiement
    @paiement.update(price_params)
    ProposalMailer.avoir(@paiement).deliver_now
    redirect_to comptabilite_path
    flash[:notice] = "L'avoir a bien été enregistrée."
  end

  def edit_amount
    @paiement = Paiement.find(params[:id])
    authorize @paiement
  end

  def change_amount
    @paiement = Paiement.find(params[:id])
    authorize @paiement
    price = price_params
    raise
    @paiement.amount_cents = price_params
    @paiement.save
    redirect_to comptabilite_path
    flash[:notice] = "Le montant a bien été modifié."
  end


  def destroy
    @paiement = Paiement.find(params[:id])
    authorize @paiement
    @paiement.destroy
    redirect_to comptabilite_path
  end

  def settle_status
    @paiement = Paiement.find(params[:id])
    authorize @paiement
    @paiement.status = "généré"
    @paiement.save
    redirect_to comptabilite_path
  end

  private

  def paiement_params
    params.require(:paiement).permit(:fournisseur_id)
  end

  def price_params
    params.require(:paiement).permit(:amount_cents)
  end
end
