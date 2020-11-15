class CreateFournisseurs < ActiveRecord::Migration[6.0]
  def change
    create_table :fournisseurs do |t|
      t.string :firstname
      t.string :lastname
      t.string :rib
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
