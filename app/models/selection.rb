class Selection < ApplicationRecord
  belongs_to :fournisseur

  has_many :products, dependent: :destroy
  has_one :notification, dependent: :destroy

  def sum_up
    sum = 0
    self.products.each do |product|
      # product price is all taxes included
      sum += product.price / 1.2
    end
    return sum
  end

  def sum_up_for_fournisseur
    sum = 0
    my_date = "2022-02-13".to_date
    self.products.each do |product|
      # apply this new calculation if my product date is > "2021-02-13"
      if product.created_at.to_date > my_date
        # product price is all taxes included
        # cette fonction doit appliquer une commission progressive pour le client selon le prix du vetement.
        if product.price >= 50.to_money
          # 70% du prix HT
          sum += (product.price/1.2) * 0.7
        elsif product.price >= 30.to_money
          # 60% du prix HT
          sum += (product.price/1.2) * 0.6
        else
          # 50% du prix HT
          sum += (product.price/1.2) * 0.5
        end
      else
        sum += (product.price/1.2) * 0.5
      end
    end
    return sum
  end

  def gain
    sum = 0
    my_date = "2022-02-13".to_date
    self.products.where(status: "vendu").each do |product|
      # apply this new calculation if my product date is > "2021-02-13"
      if product.created_at.to_date > my_date
        if product.price >= 50.to_money
          # 70% du prix HT
          sum += (product.price/1.2) * 0.7
        elsif product.price >= 30.to_money
          # 60% du prix HT
          sum += (product.price/1.2) * 0.6
        else
          # 50% du prix HT
          sum += (product.price/1.2) * 0.5
        end
      else
        sum += (product.price/1.2) * 0.5
      end
    end
    return sum
  end

  def generate_csv
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]
      self.products.each do |product|
        image_url = "http://res.cloudinary.com/grainedemomes/image/upload/" + product.photo.key.to_s
        csv << ["#{product.name}-#{product.id}","#{product.name} #{product.color}","<meta content='text/html charset=utf-8'' http-equiv=''content-type''><span data-mce-fragment=''1''>Occasion - #{product.comment}.<br>Cet article est unique.1 seul exemplaire est en stock.<br></span>","#{product.brand}","#{product.category}","#{product.genre}","true","Taille","#{product.size}","Saison","#{product.season}","","","#{product.id}","0.0","shopify",1,"deny","manual","#{product.price}","","true","true","","#{image_url}",1,"","false","","","","","","","","","","","","","","","","#{image_url}","kg","",""]
        # PENSER A INDIQUER LE PRIX EN TTC ET PAS SUR LA BASE HT
      end
    end
  end

  def percentage_sold
    result = 0.to_f
    total = self.products.all.count.to_f
    self.products.each do |product|
      if product.status == "vendu"
        result += 1
      end
    end
    percentage = (result / total) * 100
    return percentage
  end

end
