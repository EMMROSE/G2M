class JustificatifsController < ApplicationController
  def new
    # @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @justificatif = Justificatif.new
    @justificatif.fournisseur = @fournisseur
    authorize @justificatif
  end

  def create
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @justificatif = Justificatif.new(justificatif_params)
    @justificatif.fournisseur = @fournisseur
    authorize @justificatif
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

  def don
    @justificatif = Justificatif.find(params[:id])
    authorize @justificatif
    if @justificatif.don == false
      @justificatif.don = true
    elsif @justificatif.don == true
      @justificatif.don = false
    end
    @justificatif.save
    redirect_to root_path
  end

  private

  def justificatif_params
    params.require(:justificatif).permit(:justif)
  end
end
