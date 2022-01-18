class GamesController < ApplicationController
  def index
    @monster = Monster.find_by(id: params[:monster_id])

    gon.user_attack_point = @monster.user_attack_point
    gon.names = @monster.recipe_arr
  end

  def result
    @monster = Monster.find_by(id: params[:monster_id])
    @gold = @monster.level * 100

    @level_current = Level.first
    @level_next = Level.second
    @require_point = @level_next.required_gold - @level_current.required_gold
  end
end
