class Recipe < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  validates :name, presence: true
  validates :gram, presence: true
end
