class ProductsController < ApplicationController
  require 'open-uri'
  require 'json'

  def index
    if params[:query].present?
      @products = Product.search_by_brand_id_name(params[:query])
      authorize @products
    else
      @products = Product.all
      authorize @products
    end
    if @products.count == 0
      @products = Product.all
      authorize @products
    end
  end

  def stock4pro
    @brand = Brand.find(params[:id])
    @products = Product.where(brand: @brand.name, status: "à vendre")
    authorize @products
  end

  def select4pro
    @cart = @current_cart
    @product = Product.find(params[:id])
    authorize @product
    @item = Item.new(product: @product, cart: @cart)
    @item.save
    flash[:notice] = "Hop! dans la musette"
    @brand = Brand.where(name: @product.brand).first.id
    redirect_to stock4pro_path(@brand)
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new
    @selection = Selection.find(params[:selection_id])
    authorize @selection
    @product = Product.new
    authorize @product
  end

  def create
    @brands = Brand.all
    @product = Product.new(product_params)
    authorize @product
    @selection = Selection.find(params[:selection_id])
    authorize @selection
    @product.selection = @selection
    # to add a category according to name of product itself
    array1 = ["Pull", "Gilet", "Cardigan", "Sweat"]
    array2 = ["Blouse", "Chemise","Haut manches longues","Haut manches courtes"]
    array3 = ["Body", "Pyjama", "Gigoteuse", "Peignoir"]
    array4 = ["Combinaison", "Salopette", "Bloomer Salopette", "Ensemble"]
    array5 = ["Robe", "Jupe"]
    array6 = ["Pantalon", "Legging", "Jogging"]
    array7 = ["Cap", "Manteau", "Combinaison pilote", "Blouson", "Veste", "Doudoune"]
    array8 = ["Chaussures", "Chaussons"]
    array9 = ["Short", "Bloomer"]
    array10 = ["Combinaison de ski"]
    array11 = ["Maillot de bain"]
    if array1.include?(@product.name)
      @product.category = "Pulls, Mailles"
    elsif array2.include?(@product.name)
      @product.category = "Tops"
    elsif array3.include?(@product.name)
      @product.category = "Sous vêtements, Pyjamas"
    elsif array4.include?(@product.name)
      @product.category = "Ensembles, Combinaisons"
    elsif array5.include?(@product.name)
      @product.category = "Robes, Jupes"
    elsif array6.include?(@product.name)
      @product.category = "Pantalons"
    elsif array7.include?(@product.name)
      @product.category = "Manteaux, Vestes"
    elsif array8.include?(@product.name)
      @product.category = "Chaussures, Chaussons"
    elsif array9.include?(@product.name)
      @product.category = "Shorts, Bloomers"
    elsif array10.include?(@product.name)
      @product.category = "Vêtements de ski"
    elsif array11.include?(@product.name)
      @product.category = "Maillots de bain"
    else
      @product.category = "Accessoires"
    end
    # début du pricer
    if Tarif.where(brand: @product.brand, clothe: @product.name).present?
      @product.price = Tarif.where(brand: @product.brand, clothe: @product.name).first.price
    else
      @product.price = 0
    end

    # # prices = {}
    # # Brand.all.each do |element|
    # #   prices[element.name] = Hash.new
    # #   Clothe.all.each do |element2|
    #     sum = 0
    #     moy = 0
    #     var = 0
    #    Product.where(brand: @product.brand, name: @product.name).each do |x|
    #       var += 1
    #       sum += x.price
    #     end
    #     if var > 0
    #       moy = sum / var
    #        @product.price = moy
    #     else
    #       @product.price = 0
    #     end

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
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    #to edit category
    array1 = ["Pull", "Gilet", "Cardigan", "Sweat"]
    array2 = ["Blouse", "Chemise","Haut manches longues","Haut manches courtes"]
    array3 = ["Body", "Pyjama", "Gigoteuse", "Peignoir"]
    array4 = ["Combinaison", "Salopette", "Bloomer Salopette", "Ensemble"]
    array5 = ["Robe", "Jupe"]
    array6 = ["Pantalon", "Legging", "Jogging"]
    array7 = ["Cap", "Manteau", "Combinaison pilote", "Blouson", "Veste", "Doudoune"]
    array8 = ["Chaussures", "Chaussons"]
    array9 = ["Short", "Bloomer"]
    array10 = ["Combinaison de ski"]
    array11 = ["Maillot de bain"]
    if array1.include?(@product.name)
      @product.category = "Pulls, Mailles"
    elsif array2.include?(@product.name)
      @product.category = "Tops"
    elsif array3.include?(@product.name)
      @product.category = "Sous vêtements, Pyjamas"
    elsif array4.include?(@product.name)
      @product.category = "Ensembles, Combinaisons"
    elsif array5.include?(@product.name)
      @product.category = "Robes, Jupes"
    elsif array6.include?(@product.name)
      @product.category = "Pantalons"
    elsif array7.include?(@product.name)
      @product.category = "Manteaux, Vestes"
    elsif array8.include?(@product.name)
      @product.category = "Chaussures, Chaussons"
    elsif array9.include?(@product.name)
      @product.category = "Shorts, Bloomers"
    elsif array10.include?(@product.name)
      @product.category = "Vêtements de ski"
    elsif array11.include?(@product.name)
      @product.category = "Maillots de bain"
    else
      @product.category = "Accessoires"
    end
    if @product.update(product_params)
      redirect_to selection_path(@product.selection)
    else render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to selection_path(@product.selection)
  end

  def sold_status
    @product = Product.find(params[:id])
    authorize @product
    @product.status = "vendu"
    @product.save
    redirect_to selection_path(@product.selection)
  end

  def tosell_status
    @product = Product.find(params[:id])
    authorize @product
    @product.status = "à vendre"
    @product.save
    redirect_to selection_path(@product.selection)
  end

  def return_status
    @product = Product.find(params[:id])
    authorize @product
    @product.status = "retourné"
    @product.save
    redirect_to selection_path(@product.selection)
  end

  def edit_price
    @product = Product.find(params[:id])
    authorize @product
  end

  def save_price
    @tarif = Tarif.new
    @product = Product.find(params[:id])
    authorize @product
    @tarif.clothe = @product.name
    @tarif.brand = @product.brand
    @tarif.price = @product.price
    @tarif.save!
    redirect_to selection_path(@product.selection)
    flash[:notice] = "Le prix a été enregistré."
  end

  def change_price
    @product = Product.find(params[:id])
    authorize @product
    @product.update(price_params)
    @product.save
    redirect_to selection_path(@product.selection)
    flash[:notice] = "Votre prix a bien été modifié."
  end

  def duplicate
    @product = Product.new
    authorize @product
    @last_product = Product.last
    @product.name = @last_product.name
    @product.brand = @last_product.brand
    @product.size = @last_product.size
    @product.color = @last_product.color
    @product.genre = @last_product.genre
    @product.selection = @last_product.selection
    @product.price = @last_product.price
    @product.category = @last_product.category

    @product.save!
    redirect_to selection_path(@product.selection)
    flash[:notice] = "Votre produit a été dupliqué."
  end

  def import
    # start with since_id = 0 and number of products parsed = 0
    number = 0
    since_id = 0
    # Get products.count with API SHOPIFY
    url = "https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@#{ENV['SHOPIFY_API_SHOP']}.myshopify.com/admin/api/2020-10/products/count.json"
    count_serialized = RestClient.get(url)
    result = JSON.parse(count_serialized)
    total = result["count"]
    #while sum of products called with API not equal to products.count
    while number < total
      url = "https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@#{ENV['SHOPIFY_API_SHOP']}.myshopify.com/admin/api/2020-10/products.json?since_id=#{since_id}"
      user_serialized = RestClient.get(url)
      user = JSON.parse(user_serialized)
      # get status of each product, add each product to number and get last product.id to update since_id
      user["products"].each do |product|
        qty = nil
        sku = product["variants"].first.values_at("sku").first
        if Product.where(id: sku).present? && product["variants"].first.values_at("inventory_quantity").first == 0
          @product = Product.where(id: sku).first
          @product.status = "vendu"
          @product.save!
        end
        number += 1
        since_id = product["id"] + 1
      end
      skip_authorization
    end
    redirect_to products_path
    flash[:notice] = "le traitement est terminé"
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :size, :color, :genre, :price_cents, :selection_id, :photo, :season)
  end

  def price_params
    params.require(:product).permit(:price_cents)
  end
  # Ne pas oublier de remettre status par défault
end
