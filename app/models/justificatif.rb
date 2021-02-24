class Justificatif < ApplicationRecord
  belongs_to :fournisseur

  has_one_attached :justif
end
