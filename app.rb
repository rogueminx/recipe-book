require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/category")
require("./lib/recipe")
require("pg")
require("pry")

get('/') do
  erb:index
end

get('/recipes') do
  @recipes = Recipe.all
  erb:recipes
end

get('/categories') do
  @categories = Category.all
  erb:categories
end

post('/recipes') do
  recipe_name = params.fetch("recipe_name")
  ingredients = params.fetch("ingredients")
  instructions = params.fetch("instructions")
  recipe = Recipe.create({:recipe_name => recipe_name, :instructions => instructions, :ingredients => ingredients, :id => nil})
  @recipes = Recipe.all
  @categories = Category.all
  erb:recipes
end

get('/recipes/:id') do
  id = params.fetch('id')
  @recipe = Recipe.find(id)
  @categories = Category.all()
  @assigned_category = @recipe.categories
  erb:recipeinfo
end

get('/category/:id') do
  id = params.fetch('id')
  @category = Category.find(id)
  @recipes = @category.recipes
  erb:categoryinfo
end

post('/categories') do
  category_name = params.fetch("category_name")
  recipe = Category.create({:category_name => category_name, :id => nil})
  @recipes = Recipe.all
  @categories = Category.all
  erb:categories
end

post("/recipes/:id/category") do
  recipe_id = params.fetch("id")
  category_id = params.fetch ("category_id")
  current_category = Category.find(category_id)
  @recipe = Recipe.find(recipe_id)
  @recipe.categories.push(current_category)
  @assigned_category = @recipe.categories
  @categories = Category.all()
  erb:recipeinfo
end

patch("/recipes/:id/name") do
  recipe_name = params.fetch("recipe_name")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:recipe_name => recipe_name})
  @assigned_category = @recipe.categories
  @categories = Category.all()
  erb:recipeinfo
end

patch("/recipes/:id/ingredients") do
  ingredients = params.fetch("ingredients")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:ingredients => ingredients})
  @assigned_category = @recipe.categories
  @categories = Category.all()
  erb:recipeinfo
end

patch("/recipes/:id/instructions") do
  instructions = params.fetch("instructions")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:instructions => instructions})
  @assigned_category = @recipe.categories
  @categories = Category.all()
  erb:recipeinfo
end

delete("/recipes/:id") do
  recipe = Recipe.find(params.fetch("id").to_i())
  recipe.delete()
  @recipes = Recipe.all
  @categories = Category.all
  erb:recipes
end

delete("/categories/:id") do
  category = Category.find(params.fetch("id").to_i())
  category.delete()
  @categories = Category.all
  erb:categories
end

delete("/categories/:id/recipe") do
  recipe_id = params.fetch("recipe_id")
  category_id = params.fetch ("id")
  current_category = Category.find(category_id)
  @recipe = Recipe.find(recipe_id)
  @recipe.categories.destroy(current_category)
  @assigned_category = @recipe.categories
  @categories = Category.all()
  erb:recipeinfo
end
