class Brand < ApplicationRecord

  def percentage
    @products = Product.all
    percentage = ((@products.where(brand: self.name).count.to_f / @products.count.to_f)*100).round(2)
    return percentage
  end

  def percentagebysize(size)
    @products = Product.all
    percentagebysize = ((@products.where(brand: self.name, size: size).count.to_f / @products.count.to_f)*100).round(2)
    return percentagebysize
  end
end
