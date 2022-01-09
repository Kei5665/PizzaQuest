class GamesController < ApplicationController
  def index
    @monster = Monster.find_by(id: 1)

    names = []
    @monster.recipes.each do |recipe|
      names.push(recipe.name)
    end
    gon.names = names
  end
end
