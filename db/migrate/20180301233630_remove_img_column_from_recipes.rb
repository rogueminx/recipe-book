class RemoveImgColumnFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column(:recipes, :img, :text)
  end
end
