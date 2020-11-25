class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :status, default: "not yet"
      t.references :selection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
