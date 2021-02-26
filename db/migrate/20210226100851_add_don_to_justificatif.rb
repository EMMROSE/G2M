class AddDonToJustificatif < ActiveRecord::Migration[6.0]
  def change
    add_column :justificatifs, :don, :boolean, default: false
  end
end

