class SelectionsController < ApplicationController
  require 'date'
  require 'csv'


  def index
    @fournisseur = Fournisseur.find(params[:fournisseur_id])
    @selections = @fournisseur.selections
    authorize @selections
  end

  def show
    @selection = Selection.find(params[:id])
    authorize @selection
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

  def etiquette
    @selection = Selection.find(params[:id])
    authorize @selection
    @fournisseur = @selection.fournisseur_id
    @products = @selection.products.where(status: "à vendre")
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Etiquettes de la Sélection N°. #{@selection.id}.",
          layout: 'pdf2.html',
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
    authorize @selection
  end

  def create
    @selection = Selection.new
    authorize @selection
    @selection.date = Date.today.strftime("%d/%m/%Y")
    @selection.fournisseur = Fournisseur.find(params[:fournisseur_id])
    @selection.user_id = @selection.fournisseur.user_id
    @selection.save
    redirect_to selection_path(@selection)
  end

  def edit
    @selection = Selection.find(params[:id])
    authorize @selection
    @fournisseur = @selection.fournisseur_id
  end

  def destroy
    @selection = Selection.find(params[:id])
    authorize @selection
    @selection.destroy
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
  end

  def csv
    @selection = Selection.find(params[:id])
    authorize @selection
    # prepare my csv with Model function
    csv = @selection.generate_csv
    # prepare email and forward csv as argument
    ProposalMailer.generatecsv(csv).deliver_now
    redirect_to selection_path(@selection)
    flash[:notice] = "le CSV a bien été transmis."
  end

  def mail
    @selection = Selection.find(params[:id])
    authorize @selection
    # prepare email and forward csv as argument
    #ProposalMailer.information(@selection).deliver_now
    ProposalMailer.proposal(@selection).deliver_now
    @notification = Notification.new(selection_id: @selection.id)
    @notification.status = "transmis"
    @notification.save!
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
    flash[:notice] = "l'Email a été expédié."
  end

  def summary
    @selection = Selection.find(params[:id])
    authorize @selection
    # prepare email and forward csv as argument
    #ProposalMailer.information(@selection).deliver_now
    ProposalMailer.summary(@selection).deliver_now
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
    flash[:notice] = "l'Email a été expédié."
  end

  def return
    @selection = Selection.find(params[:id])
    authorize @selection
    @selection.return = true
    @selection.save!
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
    flash[:notice] = "Status sauvegardé"
  end

  private

  def selection_params
    params.require(:selection).permit(:date, :fournisseur_id, :user_id)
  end
end
