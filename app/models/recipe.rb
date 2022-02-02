class Recipe < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  has_many :recipe_grams, dependent: :destroy
  has_many :grams, through: :recipe_grams

  validates :name, presence: true
  validates :gram, presence: true
end
