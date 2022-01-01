class MonsterRecipe < ApplicationRecord
  belongs_to :monster
  belongs_to :recipe
end
