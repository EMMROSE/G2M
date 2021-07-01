class Brand < ApplicationRecord

  def percentagebrand
    @products = Product.where(status: "à vendre")
    percentagebrand = ((@products.where(brand: self.name).count.to_f / @products.count.to_f)*100).round(2)
    return percentagebrand
  end

  def percentagebysizeandbrand(size)
    @products = Product.where(status: "à vendre")
    percentagebysizeandbrand = ((@products.where(brand: self.name, size: size).count.to_f / @products.count.to_f)*100).round(2)
    return percentagebysizeandbrand
  end

    #pg search
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }
end
