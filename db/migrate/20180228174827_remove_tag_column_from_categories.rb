class RemoveTagColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column(:categories, :tags, :string)
    add_column(:categories, :category_name, :string)
  end
end
