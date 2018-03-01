require 'spec_helper'

describe('Category') do
  it("validates presence of category name") do
   category = Category.new({:category_name => "ai"})
   expect(category.save()).to(eq(false))
 end

end
