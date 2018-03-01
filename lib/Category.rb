
class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:category_name, {:presence => true, :length => {minimum: 3}})
  before_save(:normalize)
  private

  def normalize
    self.category_name = category_name.downcase.titleize
  end
end
