class FournisseursController < ApplicationController
  require 'date'

  def research
    if params[:query].present?
      @fournisseurs = Fournisseur.search_by_name_code(params[:query])
    else @fournisseurs = Fournisseur.all
    end
    if @fournisseurs.count == 0
      @fournisseurs = Fournisseur.all
    end
  end

  def index
    @fournisseurs = Fournisseur.all
  end

  def show
    @fournisseur = Fournisseur.find(params[:id])
    @selections = @fournisseur.selections
    @total = 0
    @sumup = 0
    @selections.each do |selection|
      @total += selection.products.count
      selection.products.each do |product|
        @sumup += product.price
      end
    end
    return @total
    return @sumup
  end

  def new
    @fournisseur = Fournisseur.new
  end

  def create
    @fournisseur = Fournisseur.new(fournisseur_params)
    numberforcode = (10000 - Fournisseur.count).to_s
    @fournisseur.code = Date.today.year.to_s + @fournisseur.firstname.chr + @fournisseur.lastname.chr + numberforcode
    if @fournisseur.save
      redirect_to furnishers_path
      flash[:notice] = "Votre fournisseur a bien été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez compléter le formulaire s'il vous plaît."
    end
  end

  def edit
    @fournisseur = Fournisseur.find(params[:id])
  end

  def update
    @fournisseur = Fournisseur.find(params[:id])
    if @fournisseur.update(fournisseur_params)
      redirect_to fournisseur_path(@fournisseur)
    else render :edit
    end
  end

  def destroy
    @fournisseur = Fournisseur.find(params[:id])
    @fournisseur.destroy
    redirect_to fournisseurs_path
  end

  private

  def fournisseur_params
    params.require(:fournisseur).permit(:firstname, :lastname, :email, :phone, :rib, :code)
  end
end
