class AddJustifToFournisseur < ActiveRecord::Migration[6.0]
  def change
    add_column :fournisseurs, :justif, :string
  end
end
