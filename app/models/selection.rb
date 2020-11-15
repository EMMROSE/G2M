class Selection < ApplicationRecord
  belongs_to :fournisseur

  has_many :products, dependent: :destroy

  def sum_up
    sum = 0
    self.products.each do |product|
      sum += product.price
    end
    return sum
  end
end
