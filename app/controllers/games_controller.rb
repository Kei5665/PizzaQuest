class GamesController < ApplicationController
  def index
    @monster = Monster.find_by(id: 1)

    names = []
    @monster.recipes.each do |recipe|
      names.push(recipe.name)
    end
    gon.names = names
  end

  def result
    @monster = Monster.find_by(id: params[:monster_id])
    @gold = @monster.level * 100
  end
end
