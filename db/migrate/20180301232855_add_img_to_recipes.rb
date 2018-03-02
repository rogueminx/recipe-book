class AddImgToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :img, :text)
  end
end
