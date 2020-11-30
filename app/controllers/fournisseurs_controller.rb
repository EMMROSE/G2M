class FournisseursController < ApplicationController
  require 'date'

  def index
    if params[:query].present?
      @fournisseurs = Fournisseur.search_by_lastname_email_code(params[:query])
    else
      @fournisseurs = Fournisseur.all
    end
    if @fournisseurs.count == 0
      @fournisseurs = Fournisseur.all
    end
    authorize @fournisseurs
  end

  # def index
  #   @fournisseurs = Fournisseur.all
  # end

  def show
    @fournisseur = Fournisseur.find(params[:id])
    authorize @fournisseur
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
    authorize @fournisseur
  end

  def create
    @fournisseur = Fournisseur.new(fournisseur_params)
    authorize @fournisseur
    numberforcode = (10000 - Fournisseur.count).to_s
    @fournisseur.code = Date.today.year.to_s + @fournisseur.firstname.chr + @fournisseur.lastname.chr + numberforcode
    @fournisseur.firstname = @fournisseur.firstname.capitalize
    @fournisseur.lastname = @fournisseur.lastname.capitalize
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
    authorize @fournisseur
  end

  def update
    @fournisseur = Fournisseur.find(params[:id])
    authorize @fournisseur
    if @fournisseur.update(fournisseur_params)
      redirect_to fournisseur_path(@fournisseur)
    else render :edit
    end
  end

  def destroy
    @fournisseur = Fournisseur.find(params[:id])
    authorize @fournisseur
    @fournisseur.destroy
    redirect_to fournisseurs_path
  end

  private

  def fournisseur_params
    params.require(:fournisseur).permit(:firstname, :lastname, :email, :phone, :rib, :code)
  end
end
