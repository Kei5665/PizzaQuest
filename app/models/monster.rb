class Monster < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  has_many :recipes, through: :monster_recipes, source: :recipe
  validates :name, presence: true
  validates :level, presence: true
end
