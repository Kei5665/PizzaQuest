class TrialsController < ApplicationController
  def index
    @monster = Monster.find_by(id: params[:monster_id])

    gon.user_attack_point = @monster.user_attack_point
    gon.names = @monster.recipe_arr
    gon.grams = @monster.gram_arr
    gon.answer_grams = @monster.answer_grams
  end
end
