class Product < ApplicationRecord
  require 'rqrcode'
  require 'chunky_png'

  belongs_to :selection, optional: true
  has_many :items, dependent: :destroy

  monetize :price_cents

  has_one_attached :photo
  # has_one_attached :barcode
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
0
  def qrcode
    @product = Product.find(params[:id])
    authorize @product
    @code = "https://g2m-management.herokuapp.com/products/#{@product.id.to_s}/add_to_list"
    @qrcode = RQRCode::QRCode.new(@code)

    @svg = @qrcode.as_svg(
      offset:0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 1,
      standalone: true,
      use_path: true
    )
  end

end
