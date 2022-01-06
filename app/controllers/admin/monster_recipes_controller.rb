class Admin::MonsterRecipesController < ApplicationController
  def index
  end

  def new
    @monster_recipe = MonsterRecipe.new
  end

  def create
    monster_recipe_params[:recipe_id].each do | r |
      monster_recipe = MonsterRecipe.new(recipe_id: r.to_i)
      monster_recipe.monster_id = monster_recipe_params[:monster_id]
      monster_recipe.save!
    end
    redirect_to admin_monsters_path
  end

  def destroy
    monster_recipe = MonsterRecipe.find(params[:id])
    monster_recipe.destroy!
    redirect_to admin_monsters_path
  end

  private

  def monster_recipe_params
    params.require(:monster_recipe).permit(:monster_id, recipe_id: [])
  end
end
