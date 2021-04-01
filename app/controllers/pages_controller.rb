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

  def fiche
    mail = current_user.email
    @fournisseur = Fournisseur.where(email: mail).first
  end

  def save_csv
    @fournisseurs = Fournisseur.all
    authorize @fournisseurs
    # prepare my csv with Model function
    csv = nil
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["FOURNISSEUR"]
      @fournisseurs.each do |fournisseur|
        csv << ["id: #{fournisseur.id}, firstname: '#{fournisseur.firstname}', lastname: '#{fournisseur.lastname}', rib: '#{fournisseur.rib}', email: '#{fournisseur.email}', phone: '#{fournisseur.phone}', code: '#{fournisseur.code}'"]
      end
    end
    # prepare email and forward csv as argument
    ProposalMailer.fournisseurcsv(csv).deliver_now
    redirect_to root_path
    flash[:notice] = "le CSV a bien été transmis."
  end
end
