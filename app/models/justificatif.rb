class Justificatif < ApplicationRecord
  belongs_to :fournisseur
  validates :justif, presence: true
end
