require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('Recipe')
require('Category')


get('/') do
  erb:index
end

post('/') do
  erb:index
end