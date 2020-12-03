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
    array1 = ["Pull", "Gilet", "Cardigan"]
    array2 = ["Blouse", "Chemise"]
    array3 = ["Body", "Pyjama", "Gigoteuse"]
    array4 = ["Combinaison", "Salopette", "Bloomer Salopette"]
    array5 = ["Robe", "Jupe"]
    array6 = ["Ensemble"]
    array7 = ["Hauts Manches Longues"]
    array8 = ["Pantalon", "Legging", "Bloomer"]
    array9 = ["Manteau", "Blouson", "Veste", "Doudoune"]
    array10 = ["Chaussures", "Chaussons"]
    array11 = ["Hauts manches courtes"]
    array12 = ["Sweat"]
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
      @product.category = "Pantalon/Legging/Bloomer"
    elsif array9.include?(@product.name)
      @product.category = "Manteau/Blouson"
    elsif array10.include?(@product.name)
      @product.category = "Chaussures/Chaussons"
    elsif array11.include?(@product.name)
      @product.category = "Hauts Manches Courtes"
    elsif array12.include?(@product.name)
      @product.category = "Sweat"
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
    array1 = ["Pull", "Gilet", "Cardigan"]
    array2 = ["Blouse", "Chemise"]
    array3 = ["Body", "Pyjama", "Gigoteuse"]
    array4 = ["Combinaison", "Salopette", "Bloomer Salopette"]
    array5 = ["Robe", "Jupe"]
    array6 = ["Ensemble"]
    array7 = ["Hauts Manches Longues"]
    array8 = ["Pantalon", "Legging", "Bloomer"]
    array9 = ["Manteau", "Blouson", "Veste", "Doudoune"]
    array10 = ["Chaussures", "Chaussons"]
    array11 = ["Hauts Manches Courtes"]
    array12 = ["Sweat"]
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
      @product.category = "Pantalon/Legging/Bloomer"
    elsif array9.include?(@product.name)
      @product.category = "Manteau/Blouson"
    elsif array10.include?(@product.name)
      @product.category = "Chaussures/Chaussons"
    elsif array11.include?(@product.name)
      @product.category = "Hauts Manches Courtes"
    elsif array12.include?(@product.name)
      @product.category = "Sweat"
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
    #tant que le nombre de produits interroger n'est pas égal à products.count
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
    params.require(:product).permit(:name, :brand, :size, :color, :genre, :price_cents, :selection_id, :photo)
  end

  def price_params
    params.require(:product).permit(:price_cents)
  end
  # Ne pas oublier de remettre status par défault
end
