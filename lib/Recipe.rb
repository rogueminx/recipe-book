#!/usr/bin/env ruby
class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)

  def self.sortrating
    
  end

end
