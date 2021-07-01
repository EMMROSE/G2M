class BrandsController < ApplicationController
  def index
    @brands = Brand.order(name: :asc)
    @clothes = Clothe.order(name: :asc)
    @colors = Color.order(name: :asc)
  end

  def research
    if params[:query].present?
      @brands = Brand.search_by_name(params[:query])
    else
      @brands = Brand.all
    end
    if @brands.count == 0
      @brands = Brand.all
    end
    authorize @brands
  end

  def new
    @brand = Brand.new
    authorize @brand
  end

  def create
    @brand = Brand.new(brand_params)
    authorize @brand
    @brand.name.capitalize!
    @brand.save
    redirect_to brands_path
  end

  # def edit
  #   @brand = Brand.find(params[:id])
  # end

  # def update
  #   @brand = Brand.find(params[:id])
  #   if @brand.update(brand_params)
  #     redirect_to brand_path(@brand)
  #   else render :edit
  #   end
  # end

  def destroy
    @brand = Brand.find(params[:id])
    authorize @brand
    @brand.destroy
    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
