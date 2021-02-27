class AddCommentaireToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :commentaire, :string
  end
end
