class PagesController < ApplicationController
  require 'csv'
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @fournisseurs = Fournisseur.all
    @selections = Selection.all
    @products = Product.all
  end

  def total(fournisseur)
    result = 0
    @fournisseur = fournisseur
    @fournisseur.selections.each do |selection|
      selection.products.each do |product|
        result += 1
      end
    end
    return result
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

  def repartitionage
    @clothes = Clothe.all
    @products = Product.where(status: "à vendre")
    @all_size = []
    @products.each do |product|
      @all_size << product.size
    end
    @all_size = @all_size.uniq
  end

  def repartitiongenre
    @all_size = []
    @products = Product.where(status: "à vendre")
    @products.each do |product|
      @all_size << product.size
    end
    @all_size = @all_size.uniq
  end

  def fiche
    mail = current_user.email
    @fournisseur = Fournisseur.where(email: mail).first
  end

end
