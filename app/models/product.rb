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

end
