class Product < ApplicationRecord
  belongs_to :selection, optional: true

  monetize :price_cents

  has_one_attached :photo
  #pg search for products
  include PgSearch::Model
  pg_search_scope :search_by_brand_id_name,
    against: [ :id, :brand, :name ],
    using: {
      tsearch: { prefix: true }
    }

  def change_status
    self.status = "vendu"
  end

  def solded
    percentage = 0.0
    solded = self.where(status: "vendu").to_f
    all = self.all.to_f
    percentage = solded / all
    return percentage
  end

end
