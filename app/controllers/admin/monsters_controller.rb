class Admin::MonstersController < ApplicationController
  def index
  end

  def new
    @monster = Monster.new
  end
end
