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

  
  def edit
    @monster = Monster.find(params[:id])
  end
  
  def update
    @monster = Monster.find(params[:id])
    if @monster.update!(monster_params)
      redirect_to admin_monsters_path
    else
      render :new
    end
  end
  
  def destroy
    monster = Monster.find(params[:id])
    monster.destroy!
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :level, :detail)
  end
end
