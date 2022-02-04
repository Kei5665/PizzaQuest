class GamesController < ApplicationController
  def index
    @monster = Monster.find_by(id: params[:monster_id])

    gon.user_attack_point = @monster.user_attack_point
    gon.names = @monster.recipe_arr
    gon.grams = @monster.gram_arr
    gon.answer_grams = @monster.answer_grams
  end

  def result
    @monster = Monster.find_by(id: params[:monster_id])
    @gold = @monster.calculate_gold

    @level_current = Level.first
    @level_next = Level.second
    @require_point = @level_next.required_gold - @level_current.required_gold

    # Userモデルを作ったら以下に書き換える↓
    # @level_current = user.level
    # @level_next = user.level.next
    # @require_point = @level_next.required_gold - @level_current.required_gold
  end
end
