#!/usr/bin/env ruby
class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)

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
    @return_array
  end

end
