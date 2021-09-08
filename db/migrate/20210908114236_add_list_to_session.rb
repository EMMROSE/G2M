class AddListToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :list, :string, array: true, default: []
  end
end
