class GamesController < ApplicationController
  def index
    @monster = Monster.find_by(id: params[:monster_id])

    names = []
    @monster.recipes.each do |recipe|
      names.push(recipe.name)
    end
    gon.names = names
  end

  def result
    @monster = Monster.find_by(id: params[:monster_id])
    @gold = @monster.level * 100

    @level_current = Level.first
    @level_next = Level.second
    @require_point = @level_next.required_gold - @level_current.required_gold
  end
end
