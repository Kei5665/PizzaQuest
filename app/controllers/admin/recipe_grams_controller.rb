class Admin::RecipeGramsController < ApplicationController
  def index; end

  def new
    @recipe_gram = RecipeGram.new
  end

  def create
    recipe_gram = RecipeGram.new(recipe_gram_params)
    recipe_gram.save!
  end

  def destroy
    recipe_gram = RecipeGram.find(params[:id])
    recipe_gram.destroy!
  end

  private

  def recipe_gram_params
    params.require(:recipe_gram).permit(:recipe_id, :gram_id )
  end
end
