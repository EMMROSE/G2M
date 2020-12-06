class AddProToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pro, :boolean
  end
end
