class Beginner::TrialController < Beginner::BaseController
  def index
    monsters = Monster.all.where(level: 1)

    monster_recipes = []
    monster_names = []

    monsters.each do |monster|
            
      recipe_arr = []
      recipe_order = monster.recipes.order(:order_num)
      recipe_order.each do |recipe|
        recipe_arr.push(recipe.name)
      end

      monster_recipes.push(recipe_arr)
      monster_names.push(monster.name)
    end

    gon.monster_recipes = monster_recipes
    gon.monster_names = monster_names
    
  end

  def result
    
  end
end
