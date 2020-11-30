class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
    authorize @clothe
  end

  def create
    @color = Color.new(color_params)
    authorize @clothe
    @color.name.capitalize!
    @color.save
    redirect_to brands_path
  end


  # def edit
  # end

  # def update
  # end

  def destroy
    @color = Color.find(params[:id])
    authorize @clothe
    @color.destroy
    redirect_to brands_path
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end
