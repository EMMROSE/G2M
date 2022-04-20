class Fournisseur < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :products, through: :selections
  has_many :paiements
  has_one :justificatif, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: false, uniqueness: true
  validates :rib, presence: false

  def sold
    sold = 0
    self.selections.each do |selection|
      selection.products.where(status: "vendu").each do |product|
        sold += ((product.price/1.2) * 0.5)
      end
    end
    return sold
  end

  def inventory
    sold = 0
    self.selections.each do |selection|
      selection.products.each do |product|
        sold += (product.price/1.2)
      end
    end
    return sold
  end

  def total
    sold = 0
    self.selections.each do |selection|
      selection.products.each do |product|
        sold += 1
      end
    end
    return sold
  end

  def settle
    sum = 0
    self.paiements.where(status: "généré").each do |element|
      sum += element.amount
    end
    return sum
  end

  def credit
    credit = self.sold.to_f - (self.settle * 100).to_f
    return credit.to_i
  end

  def sales
    self.count
  end

  def save_fournisseur_csv
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["EMAIL DES FOURNISSEURS"]
      Fournisseur.all.each do |fournisseur|
        csv << ["#{fournisseur.email}"]
      end
      csv << ["FOURNISSEUR"]
      Fournisseur.all.each do |fournisseur|
        csv << ["f = Fournisseur.new(id: #{fournisseur.id}, firstname: '#{fournisseur.firstname}', lastname: '#{fournisseur.lastname}', rib: '#{fournisseur.rib}', email: '#{fournisseur.email}', phone: '#{fournisseur.phone}', code: '#{fournisseur.code}')"]
        csv << ["f.save!"]
      end
      Selection.all.each do |selection|
        csv << ["s = Selection.new(id: #{selection.id}, date: '#{selection.date}', fournisseur_id: #{selection.fournisseur_id})"]
        csv << ["s.save!"]
      end
      Product.order("id ASC").each do |product|
          csv << ["p = Product.new(id: #{product.id}, brand: '#{product.brand}', name: '#{product.name}', size: '#{product.size}', color: '#{product.color}', status: '#{product.status}', price_cents: #{product.price_cents}, price_currency: 'EUR', selection_id: #{product.selection_id})"]
          csv << ["p.save!"]
      end
      User.all.each do |user|
        csv << ["u = User.new(id: #{user.id}, email: '#{user.email}', admin: #{user.admin}, pro: #{user.pro})"]
        csv << ["u.save!"]
      end
      Justificatif.all.each do |element|
        csv << ["u = Justificatif.new(id: #{element.id}, justif: '#{element.justif}', fournisseur_id: #{element.fournisseur_id})"]
        csv << ["u.save!"]
      end
    end
  end

  def save_fournisseur_csv2
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["N°id","Type","Marque","Taille","Genre","Prix HT","Prix KIABI"]
      Product.order("id ASC").each do |product|
        if product.status == "à vendre"
          csv << ["#{product.id}","#{product.name}","#{product.brand}","#{product.size}","#{product.genre}","#{product.price*1.2}","#{product.price*0.96}"]
        end
      end
    end
  end

  # def save_product_csv
  #   csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
  #   CSV.generate(csv_options) do |csv|
  #     range = (1..7000).to_a
  #     range.each do |number|
  #       if Product.where(id: number).present? == false
  #       # Product.order("id ASC").each do |product|
  #         csv << ["p = Product.new(id: #{number}, price_cents: 0, price_currency: 'EUR', selection_id: 217)"]
  #         csv << ["p.save!"]
  #       end
  #     end
  #   end
  # end

  #pg search
  include PgSearch::Model
  pg_search_scope :search_by_lastname_email_code,
    against: [ :lastname, :email, :code ],
    using: {
      tsearch: { prefix: true }
    }
end
