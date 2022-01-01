class Recipe < ApplicationRecord
  belongs_to :monster
  has_many :monster_recipes, dependent: :destroy
end
