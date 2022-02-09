class Monster < ApplicationRecord
  has_many :monster_recipes, dependent: :destroy
  has_many :recipes, through: :monster_recipes, source: :recipe
  validates :name, presence: true
  validates :level, presence: true

  def user_attack_point
    100 / recipes.size
  end

  def recipe_arr
    recipe_arr = []

    recipe_order = recipes.order(:order_num)
    recipe_order.each do |recipe|
      recipe_arr.push(recipe.name)
    end
    recipe_arr
  end

  def calculate_gold
    level * 100
  end

  def gram_arr
    recipe_gram_arr = []

    recipes.order(:order_num).each do |monster_recipe|
      recipe = Recipe.find(monster_recipe.id)
      gram_arr = []

      recipe.grams.each do |gram|
        gram_arr.push(gram.gram)
      end

      recipe_gram_arr.push(gram_arr)
    end

    recipe_gram_arr
  end

  def answer_grams
    gram_answers = []

    recipes.order(:order_num).each do |recipe|
      gram_answers.push(recipe.gram)
    end
    gram_answers
  end
end
