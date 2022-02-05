class Admin::GramsController < ApplicationController
  def index
    @grams = Gram.all
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(gram_params)
    @gram.save!
  end

  private

  def gram_params
    params.require(:gram).permit(:gram)
  end
end
