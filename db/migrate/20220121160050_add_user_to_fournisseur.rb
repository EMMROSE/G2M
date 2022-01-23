class AddUserToFournisseur < ActiveRecord::Migration[6.0]
  def change
    add_reference :fournisseurs, :user, index: true
  end
end
