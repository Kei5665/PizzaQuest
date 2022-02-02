class Gram < ApplicationRecord
  has_many :recipe_grams, dependent: :destroy
  has_many :recipes, through: :recipe_grams

end
