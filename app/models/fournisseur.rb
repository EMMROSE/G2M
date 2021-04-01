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
    credit = self.sold - self.settle
    return credit
  end

  def sales
    self.count
  end

  def save_fournisseur_csv
    csv_options = { col_sep: ',', encoding: 'ISO-8859-1'}
    CSV.generate(csv_options) do |csv|
      csv << ["FOURNISSEUR"]
      Fournisseur.all.each do |fournisseur|
        csv << ["id: #{fournisseur.id}, firstname: '#{fournisseur.firstname}', lastname: '#{fournisseur.lastname}', rib: '#{fournisseur.rib}', email: '#{fournisseur.email}', phone: '#{fournisseur.phone}', code: '#{fournisseur.code}'"]
      end
    end
  end

  #pg search
  include PgSearch::Model
  pg_search_scope :search_by_lastname_email_code,
    against: [ :lastname, :email, :code ],
    using: {
      tsearch: { prefix: true }
    }
end
