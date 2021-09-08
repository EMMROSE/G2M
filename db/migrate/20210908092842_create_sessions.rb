class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
