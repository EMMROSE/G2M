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
    previous_paiements = 0.to_money
    Paiement.where(fournisseur_id: @fournisseur.id).each do |paiement|
      previous_paiements += paiement.amount_cents
    end
    @paiement.amount_cents = @paiement.fournisseur.credit - previous_paiements
    @paiement.save
    ProposalMailer.paiement(@paiement).deliver_now
    redirect_to root_path
  end


  def edit
  end

  def update
  end

  def destroy
    @paiement = Paiement.find(params[:id])
    authorize @paiement
    @paiement.destroy
    redirect_to comptabilite_path
  end

  def settle_status
    paiement = Paiement.find(params[:id])
    authorize @paiement
    paiement.status = "généré"
    paiement.save
    redirect_to comptabilite_path
  end

  private

  def paiement_params
    params.require(:paiement).permit(:fournisseur_id)
  end
end
