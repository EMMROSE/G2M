class AddCommentToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :comment, :string
  end
end
