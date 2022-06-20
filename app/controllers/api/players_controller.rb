class Api::PlayersController < ApplicationController
    def index
      @players = Player
        .order(:player_name)
  
      render "index.json.jb"
    end
  
    def create
      @player = Player.create!(
        player_name: params[:player_name],
        wins: 0,
      )
      logger.info("New Player #{@player} created")
      render "show.json.jb", status: 201
    end
  
    def show
      @player = Player.find_by!(id: params[:id])
      render "show.json.jb"
    end
  
    def update
      @player = Player.find_by!(id: params[:id])
      @player.player_name = params[:player_name] || @player.player_name
      @player.wins = params[:wins] || @player.wins
      @player.save!
  
      render "show.json.jb"
    end
  
    def destroy
      @player = Player.find_by!(id: params[:id])
      @player.destroy!
  
      render "show.json.jb"
    end
  end