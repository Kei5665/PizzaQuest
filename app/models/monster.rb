class Monster < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  has_many :recipes, through: :monster_recipes, source: :recipe
end
