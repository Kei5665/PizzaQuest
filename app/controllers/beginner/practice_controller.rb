class Beginner::PracticeController < Beginner::BaseController
  def index
    monsters = Monster.all.where(level: 1)

    @monsterss = []

    monsters.each do |monster|
      recipe_arr = []

      recipe_order = monster.recipes.order(:order_num)
      recipe_order.each do |recipe|
        recipe_arr.push(recipe.name)
      end

      @monsterss.push(recipe_arr)
    end

    gon.monsters = @monsterss

  end
end
