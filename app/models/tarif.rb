class Tarif < ApplicationRecord
  monetize :price_cents
end
