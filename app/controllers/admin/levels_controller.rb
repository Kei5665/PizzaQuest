class Admin::LevelsController < ApplicationController
  def index
    @levels = Level.all
  end

  def new
    @level = Level.new
  end

  def create
    level = Level.new(level_params)
    level.save!
  end

  def destroy
    level = Level.find(params[:id])
    level.destroy!
  end

  private

  def level_params
    params.require(:level).permit(:level_name, :required_gold)
  end
end
