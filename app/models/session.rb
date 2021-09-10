class Session < ApplicationRecord

  def generate_csv2
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]
      self.list.each do |id|
        id = id.to_i
        product = Product.where(id: id).first
        if product.status == "vendu" && product.photo.present?
        image_url = "http://res.cloudinary.com/grainedemomes/image/upload/" + product.photo.key.to_s
        csv << ["#{product.name}-#{product.id}","#{product.name} #{product.brand} #{product.size}","<meta content='text/html charset=utf-8'' http-equiv=''content-type''><span data-mce-fragment=''1''>Occasion - #{product.comment}.<br>Cet article est unique.1 seul exemplaire est en stock.<br>#{product.commentaire}</span>","#{product.brand}","#{product.category}","#{product.genre}","false","Taille","#{product.size}","Saison","#{product.season}","","","#{product.id}","0.0","shopify",1,"deny","manual","#{product.price}","","true","true","","#{image_url}",1,"","false","","","","","","","","","","","","","","","","#{image_url}","kg","",""]
        # PENSER A INDIQUER LE PRIX EN TTC ET PAS SUR LA BASE HT
        end
      end
    end
  end

end
