class JustificatifsController < ApplicationController
  def new
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @justificatif = Justificatif.new
    authorize @justificatif
  end

  def create
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @justificatif = Justificatif.new(justificatif_params)
    authorize @justificatif
    if @justificatif.save
      redirect_to root_path
    else
      render :new
      flash[:alert] = "Veuillez télécharger votre RIB s'il vous plaît."
    end
  end

  private

  def justificatif_params
    params.require(:justificatif).permit(:fournisseur_id, :justif)
  end
end
