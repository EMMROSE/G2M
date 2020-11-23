class SelectionsController < ApplicationController
  require 'date'
  require 'csv'

  def index
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @selections = @fournisseur.selections
  end

  def show
    @selection = Selection.find(params[:id])
    @fournisseur = @selection.fournisseur_id
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Sélection N°. #{@selection.id} de #{@selection.fournisseur.firstname} #{@selection.fournisseur.lastname} du #{@selection.date}.",
          layout: 'pdf.html',
          page_size: 'A4',
          template: "selections/show.html.erb",
          background: false,
          no_background: true,
          lowquality: true,
          zoom: 1,
          dpi: 300,
          encoding:"UTF-8"
      end
    end
  end

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new
    @selection.date = Date.today.strftime("%d/%m/%Y")
    @selection.fournisseur = Fournisseur.find(params[:fournisseur_id])
    @selection.save
    redirect_to selection_path(@selection)
  end

  def edit
    @selection = Selection.find(params[:id])
    @fournisseur = @selection.fournisseur_id
  end

  def destroy
    @selection = Selection.find(params[:id])
    @selection.destroy
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
  end

  def csv
    @selection = Selection.find(params[:id])
    # prepare my csv with Model function
    csv = @selection.generate_csv
    # prepare email and forward csv as argument
    ProposalMailer.generatecsv(csv).deliver_now
    redirect_to selection_path(@selection)
    flash[:notice] = "le CSV a bien été transmis."
  end

  def mail
    @selection = Selection.find(params[:id])
    # prepare email and forward csv as argument
    #ProposalMailer.information(@selection).deliver_now
    ProposalMailer.proposal(@selection).deliver_now
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
    flash[:notice] = "l'Email a été expédié."
  end

  private

  def selection_params
    params.require(:selection).permit(:date, :fournisseur_id)
  end
end
