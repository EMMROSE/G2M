class ClothesController < ApplicationController
  def index
    @clothes = Clothe.all
    authorize @clothes
  end

  def new
    @clothe = Clothe.new
    authorize @clothe
  end

  def create
    @clothe = Clothe.new(clothe_params)
    authorize @clothe
    @clothe.name.capitalize!
    @clothe.save
    redirect_to brands_path
  end


  # def edit
  # end

  # def update
  # end

  def destroy
    @clothe = Clothe.find(params[:id])
    authorize @clothe
    @clothe.destroy
    redirect_to brands_path
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name)
  end
end
