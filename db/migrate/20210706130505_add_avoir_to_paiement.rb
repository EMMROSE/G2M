class AddAvoirToPaiement < ActiveRecord::Migration[6.0]
  def change
    add_column :paiements, :avoir, :boolean, default: false
  end
end
