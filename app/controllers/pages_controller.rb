class PagesController < ApplicationController
  require 'csv'
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user.present?
      @fournisseurs = Fournisseur.where(user_id: current_user.id).all #Fournisseur.all
      @selections = Selection.where(user_id: current_user.id).all #Selection.all
      @products = Product.where(user_id: current_user.id).all #Product.all
    end
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
    @all_size = @all_size.sort
    @all_category = []
    @products.each do |product|
      @all_category << product.category
    end
    @all_category = @all_category.uniq
    @all_category = @all_category.sort
  end

  def repartitiongenre
    @all_size = ['0 mois', '1 mois','3 mois','3-6 mois','6 mois','6-9 mois','9 mois','9-12 mois','12 mois','12-18 mois','18 mois','18-24 mois','2 ans', '2-3 ans','3 ans','3-4 ans', '4 ans', '5 ans', '6 ans', '7 ans', '8 ans', '9 ans', '10 ans', '11 ans', '12 ans', '14 ans', 'Pointure 15', 'Pointure 16', 'Pointure 17', 'Pointure 18', 'Pointure 19', 'Pointure 20', 'Pointure 21', 'Pointure 22', 'Pointure 23', 'Pointure 24', 'Pointure 25', 'Pointure 26', 'Pointure 27', 'Pointure 28', 'Pointure 29', 'Pointure 30', 'Pointure 31', 'Pointure 32', 'Pointure 33', 'Pointure 34', 'N/A']
  end

  def fiche
    mail = current_user.email
    @fournisseur = Fournisseur.where(email: mail).first
  end

end
