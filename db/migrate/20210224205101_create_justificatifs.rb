class CreateJustificatifs < ActiveRecord::Migration[6.0]
  def change
    create_table :justificatifs do |t|
      t.string :justif
      t.references :fournisseur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
