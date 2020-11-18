class ProductsController < ApplicationController
  def index
    # Status filter
    @products = @products.where(status: params[:status]) if params[:status].present?
    # FOURNISSEUR filter THROUGHT SELECTION ID ??
    @products = @products.selection.where(fournisseur: params[:fournisseur]) if params[:fournisseur].present?
    # # Size filter
    @products = @products.article.where(size: params[:size]) if params[:size].present?

    @products = Product.all
  end

  # def research
  #   if params[:query].present?
  #     @products = Product.search_by_name_sku(params[:query])
  #   else @products = Product.all
  #   end
  #   if @products.count == 0
  #     @products = Product.all
  #   end
  # end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @selection = Selection.find(params[:selection_id])
    @product = Product.new
  end

  def create
    @brands = Brand.all
    @product = Product.new(product_params)
    @selection = Selection.find(params[:selection_id])
    @product.selection = @selection
    # to add a category according to name of product itself

    array1 = ["Pull", "Gilet", "Cardigan"]
    array2 = ["Blouse", "Chemise"]
    array3 = ["Body", "Pyjama", "Gigoteuse"]
    array4 = ["Combinaison", "Salopette", "Bloomer Salopette"]
    array5 = ["Robe", "Jupe"]
    array6 = ["Ensemble"]
    array7 = ["Hauts Manches Longues"]
    array8 = ["Pantalon", "Leggin", "Bloomer"]
    array9 = ["Manteau", "Blouson", "Veste", "Doudoune"]
    array10 = ["Chaussures", "Chaussons"]
    if array1.include?(@product.name)
      @product.category = "Pull/Gilet/Cardigan"
    elsif array2.include?(@product.name)
      @product.category = "Blouse/Chemise"
    elsif array3.include?(@product.name)
      @product.category = "Body/Pyjama"
    elsif array4.include?(@product.name)
      @product.category = "Combinaison/Salopette"
    elsif array5.include?(@product.name)
      @product.category = "Robe/Jupe"
    elsif array6.include?(@product.name)
      @product.category = "Ensemble"
    elsif array7.include?(@product.name)
      @product.category = "Hauts Manches Longues"
    elsif array8.include?(@product.name)
      @product.category = "Pantalon/Leggin/Bloomer"
    elsif array9.include?(@product.name)
      @product.category = "Manteau/Blouson"
    elsif array10.include?(@product.name)
      @product.category = "Chaussures/Chaussons"
    else
      @product.category = "Accessoires"
    end
    # début du pricer
    # prices = {}
    # Brand.all.each do |element|
    #   prices[element.name] = Hash.new
    #   Clothe.all.each do |element2|
        sum = 0
        moy = 0
        var = 0
       Product.where(brand: @product.brand, name: @product.name).each do |x|
          var += 1
          sum += x.price
        end
        if var > 0
          moy = sum / var
           @product.price = moy
        else
          @product.price = 0
        end

    if @product.save && params[:commit] == 'Créer le produit'
      redirect_to selection_path(@selection)
      flash[:notice] = "Votre produit a bien été enregistré."
    elsif @product.save && params[:commit] == 'Créer un autre produit'
      redirect_to new_selection_product_path(@selection)
      flash[:notice] = "Votre produit a bien été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez compléter le formulaire s'il vous plaît."
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to selection_path(@product.selection)
    else render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to selection_path(@product.selection)
  end

  def sold_status
    product = Product.find(params[:id])
    product.status = "vendu"
    product.save
    redirect_to stocks_path
  end

  def tosell_status
    product = Product.find(params[:id])
    product.status = "à vendre"
    product.save
    redirect_to stocks_path
  end

  def return_status
    product = Product.find(params[:id])
    product.status = "retourné"
    product.save
    redirect_to stocks_path
  end

  def edit_price
    @product = Product.find(params[:id])
  end

  def change_price
    @product = Product.find(params[:id])
    @product.update(price_params)
    @product.save
    redirect_to selection_path(@product.selection)
    flash[:notice] = "Votre prix a bien été modifié."
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :size, :color, :genre, :price_cents, :selection_id, :photo)
  end

  def price_params
    params.require(:product).permit(:price_cents)
  end
  # Ne pas oublier de remettre status par défault
end
