class ClothesController < ApplicationController
  def index
    @clothes = Clothe.all
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
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
    @clothe.destroy
    redirect_to clothes_path
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name)
  end
end
