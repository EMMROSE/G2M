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
        render pdf: "Récapitulatif de la sélection No. #{@selection.id} du #{@selection.date}.",
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
    @selection.date = Date.today
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
    filepath = 'test_import_products.csv'
    @selection = Selection.find(params[:id])
    CSV.open(filepath, 'wb') do |csv|
      csv << ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]
      @selection.products.each do |product|
        csv << ["#{product.name}-#{product.id}","#{product.name} #{product.color}",'<meta content="text/html charset=utf-8"" http-equiv=""content-type""><span data-mce-fragment=""1"">état: occasion - excellent état</span>',"#{product.brand}","#{product.category}","#{product.genre}","false","Taille","#{product.size}","","","","","","0.0","shopify",1,"deny","manual","#{product.price*1.2}","","true","true","","","","","false","","","","","","","","","","","","","","","","","kg","",""]
      # PENSER A INDIQUER LE PRIX EN TTC ET PAS SUR LA BASE HT
      end
    end
    redirect_to selection_path(@selection)
    flash[:notice] = "le CSV a bien été enregistré."
  end

  def mail
    @selection = Selection.find(params[:id])
    ProposalMailer.information(@selection).deliver_now
    redirect_to selections_path(fournisseur_id: @selection.fournisseur.id)
    flash[:notice] = "l'Email a été expédié."
  end

  private

  def selection_params
    params.require(:selection).permit(:date, :fournisseur_id)
  end
end
