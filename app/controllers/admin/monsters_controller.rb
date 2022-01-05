class Admin::MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to admin_monsters_path
    else
      render :new
    end
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :level, :detail)
  end
end
