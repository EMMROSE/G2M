class PricesController < ApplicationController

  def new
    @brand = Brand.find(params[:brand_id])
    @clothe = Clothe.find(params[:clothe_id])
    @price = Price.new
    authorize @price
  end

  def create
    @price = Price.new(price_params)
    authorize @price
    if @price.save
      redirect_to pricer_path
      flash[:notice] = "Le prix a bien été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez renseigner le prix correctement s'il vous plaît."
    end
  end

  def edit
    @price = Price.find(params[:id])
    authorize @price
  end

  def update
    @price = Price.find(params[:id])
    authorize @price
    if @price.update(price_params)
      redirect_to pricer_path
    else
      render :edit
    end
  end

  private

  def price_params
    params.require(:price).permit(:brand, :clothe, :price_cents)
  end

end
