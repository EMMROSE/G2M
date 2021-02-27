class AddCommentairesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :commentaires, :string
  end
end
