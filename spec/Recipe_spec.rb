require 'spec_helper'

describe(Recipe) do
  describe(".sortrating") do
    it("sorts recipe by their rating") do
      test_recipe = Recipe.create({:recipe_name => "Taco", :ingredients => "Bean, cheese, tortilla", :instructions => "Roll that shit up", :rating => 3, :id => nil})
      test_recipe2 = Recipe.create({:recipe_name => "Burrito", :ingredients => "Bean, cheese, tortilla", :instructions => "Roll that shit up", :rating => 5, :id => nil})
      test_recipe3 = Recipe.create({:recipe_name => "Taquito", :ingredients => "Bean, cheese, tortilla", :instructions => "Roll that shit up", :rating => 2, :id => nil})
        expect(Recipe.sortrating()).to(eq([test_recipe2, test_recipe, test_recipe3]))
    end
  end

  describe(".findingredient") do
    it("finds recipe ingredient") do
      test_recipe = Recipe.create({:recipe_name => "Taco", :ingredients => "Bean, cheese, tortilla", :instructions => "Roll that shit up", :rating => 3, :id => nil})
      test_recipe2 = Recipe.create({:recipe_name => "Burrito", :ingredients => "Bean , Cheese, tortilla", :instructions => "Roll that shit up", :rating => 5, :id => nil})
      test_recipe3 = Recipe.create({:recipe_name => "Taquito", :ingredients => "Cheese, tortilla, lettuce", :instructions => "Roll that shit up", :rating => 2, :id => nil})
      expect(Recipe.findingredient("lettuce")).to(eq([test_recipe3]))
    end
  end

  it("validates presence of recipe") do
   recipe = Recipe.new({:recipe_name => ""})
   expect(recipe.save()).to(eq(false))
 end

   it("validates presence of ingredients") do
    recipe = Recipe.new({:recipe_name => "Potato", :ingredients => ""})
    expect(recipe.save()).to(eq(false))
  end

  it("validates presence of instructions") do
   recipe = Recipe.new({:recipe_name => "Potato", :ingredients => "potato", :instructions => ""})
   expect(recipe.save()).to(eq(false))
 end

end
