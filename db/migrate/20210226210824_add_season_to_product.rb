class AddSeasonToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :season, :string
  end
end
