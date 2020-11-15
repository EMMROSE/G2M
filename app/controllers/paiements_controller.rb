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
  end

  def create
    @paiement = Paiement.new(paiement_params)
    @paiement.date = Date.today
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @paiement.fournisseur = @fournisseur
    @paiement.save
    redirect_to fournisseur_path(@fournisseur)
  end


  def edit
  end

  def update
  end

  def destroy
    @paiement = Paiement.find(params[:id])
    @paiement.destroy
    redirect_to comptabilite_path
  end

  def settle_status
    paiement = Paiement.find(params[:id])
    paiement.status = "généré"
    paiement.save
    redirect_to comptabilite_path
  end

  private

  def paiement_params
    params.require(:paiement).permit(:date, :amount_cents, :fournisseur_id)
  end
end
