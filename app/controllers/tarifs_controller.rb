class TarifsController < ApplicationController

  def new
    @tarif = Tarif.new
    authorize @tarif
  end

  def create
    @tarif = Tarif.new(tarif_params)
    authorize @tarif
    if @tarif.save
      redirect_to pricer_path
      flash[:notice] = "Le prix a bien été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez renseigner le prix correctement s'il vous plaît."
    end
  end

  def edit
    @tarif = Tarif.find(params[:id])
    authorize @tarif
  end

  def update
    @tarif = Tarif.find(params[:id])
    authorize @tarif
    if @tarif.update(tarif_params)
      redirect_to pricer_path
    else
      render :edit
    end
  end

  private

  def tarif_params
    params.require(:tarif).permit(:brand, :clothe, :price_cents)
  end

end
