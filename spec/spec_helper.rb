ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("category")
require("recipe")

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
    Category.all().each() do |category|
      category.destroy()
    end
end
