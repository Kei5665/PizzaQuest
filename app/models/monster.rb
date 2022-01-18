class Monster < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  has_many :recipes, through: :monster_recipes, source: :recipe
  validates :name, presence: true
  validates :level, presence: true

  def user_attack_point
    100 / self.recipes.size
  end

  def recipe_arr
    recipe_arr = []

    recipe_order = self.recipes.order(:order_num)
    recipe_order.each do |recipe|
      recipe_arr.push(recipe.name)
    end
    recipe_arr
  end
end
