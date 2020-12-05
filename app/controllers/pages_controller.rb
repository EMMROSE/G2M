class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @fournisseurs = Fournisseur.all
    @selections = Selection.all
    @products = Product.all
  end

  def stat
    @fournisseurs = Fournisseur.all
    @selections = Selection.all
    @products = Product.all
  end

  def repartition
    @brands = Brand.all
    @products = Product.where(status: "à vendre")
    @all_brands = []
    @brands.each do |brand|
      @all_brands << brand
    end
    @all_size = []
    @products.each do |product|
      @all_size << product.size
    end
    @all_size = @all_size.uniq
    @brands.each do |brand|
      @percentage = @products.where(brand: brand.name).count / @products.count
    end
  end
end
