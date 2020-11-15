class Paiement < ApplicationRecord
  belongs_to :fournisseur
  monetize :amount_cents
end
