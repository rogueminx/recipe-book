#!/usr/bin/env ruby
class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  validates(:recipe_name, {:presence => true, :length => {minimum: 3}})
  validates(:ingredients, {:presence => true, :length => {minimum: 3}})
  validates(:instructions, {:presence => true, :length => {minimum: 3}})
  before_save(:normalize)

 private

  def normalize
    self.recipe_name = recipe_name.downcase.titleize
    self.ingredients = ingredients.downcase
    self.instructions = instructions.downcase
  end

  def self.sortrating
    ordered_recipes = Recipe.all.order('rating').reverse
  end

  def self.findingredient(search_ingredient)
    @recipes = Recipe.all
    @ingredient_array = []
      @recipes.each() do |recipe|
        @ingredient_array.push((recipe.ingredients).downcase)
      end
    @return_array = []
    @ingredient_array.each() do |ingredient|
      if ingredient.include?(search_ingredient)
        @return_array.push(ingredient)
      end
    end
    @last_array = []
    @recipes.each() do |recipe|
      @return_array.each() do |item|
        if recipe.ingredients.downcase == item
          if (@last_array.include?(recipe) == false)
            @last_array.push(recipe)
          end
        end
      end
    end
    @last_array
  end #findingredient

end #Recipe
