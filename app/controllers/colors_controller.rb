class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
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
    @color.destroy
    redirect_to brands_path
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end
