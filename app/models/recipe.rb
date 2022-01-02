class Recipe < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
end
