class GamesController < ApplicationController
  def index
  end

  def create
    game = Game.create

    redirect_to game
  end

  def show
    @game = Game.find(params[:id])
  end
end
