class JustificatifsController < ApplicationController
  def new
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @justificatif = Justificatif.new
    authorize @justificatif
  end

  def create
    @justificatif = Justificatif.new(justificatif_params)
    authorize @justificatif
    @justificatif.fournisseur = Fournisseur.find(params[:fournisseur_id])
    if @justificatif.save
      redirect_to root_path
    else
      render :new
      flash[:alert] = "Veuillez compléter le code IBAN."
    end
  end

  def edit
    @justificatif = Justificatif.find(params[:id])
    authorize @justificatif
  end

  def update
    @justificatif = Justificatif.find(params[:id])
    authorize @justificatif
    if @justificatif.update(justificatif_params)
      redirect_to root_path
    else
      render :new
      flash[:alert] = "Veuillez compléter le code IBAN."
    end
  end

  private

  def justificatif_params
    params.require(:justificatif).permit(:justif)
  end
end
