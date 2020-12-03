class CreateTarifs < ActiveRecord::Migration[6.0]
  def change
    create_table :tarifs do |t|
      t.string :brand
      t.string :clothe
      t.monetize :price

      t.timestamps
    end
  end
end
