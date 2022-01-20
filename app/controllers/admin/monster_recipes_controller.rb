class Admin::MonsterRecipesController < ApplicationController
  def index; end

  def new
    @monster_recipe = MonsterRecipe.new
  end

  def create
    @monster = MonsterRecipe.new(monster_recipe_params)
    @monster.save!
  end

  def destroy
    monster_recipe = MonsterRecipe.find(params[:id])
    monster_recipe.destroy!
    redirect_to admin_monsters_path
  end

  private

  def monster_recipe_params
    params.require(:monster_recipe).permit(:monster_id, :recipe_id, :order_num)
  end
end
