class Fournisseur < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :products, through: :selections
  has_many :paiements

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :rib, presence: false

  def sold
    sold = 0
    self.selections.each do |selection|
      selection.products.where(status: "vendu").each do |product|
        sold += (product.price * 0.5)
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
end
