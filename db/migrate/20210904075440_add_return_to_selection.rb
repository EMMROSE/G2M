class AddReturnToSelection < ActiveRecord::Migration[6.0]
  def change
    add_column :selections, :return, :boolean, default: false
  end
end
