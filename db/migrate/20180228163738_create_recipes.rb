class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:ingredients, :text)
      t.column(:instructions, :text)

      t.timestamps()
    end
  end
end
