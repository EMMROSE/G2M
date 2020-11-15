class CreateSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :selections do |t|
      t.text :date
      t.references :fournisseur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
