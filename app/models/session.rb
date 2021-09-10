class Session < ApplicationRecord

  def generate_csv2
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["Handle","Title","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","SKU","HS Code","COO","Boutique Graine de Mômes"]
      self.list.each do |id|
        id = id.to_i
        product = Product.where(id: id).first
        if product.status == "vendu" && product.photo.present?
        image_url = "http://res.cloudinary.com/grainedemomes/image/upload/" + product.photo.key.to_s
        csv << ["#{product.name}-#{product.id}","#{product.name} #{product.brand} #{product.size}","Taille","#{product.size}","Saison","#{product.season}","","","#{product.id}","","",0]
        # PENSER A INDIQUER LE PRIX EN TTC ET PAS SUR LA BASE HT
        end
      end
    end
  end

end
