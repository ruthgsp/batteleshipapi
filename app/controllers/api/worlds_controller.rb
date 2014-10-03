class Api::WorldsController < ApplicationController
  def create
    #get coordinates
    coordinates = {x: 5, y: 5}
    #check if hit or miss

    @world = World.create(game_set_id: params[:game_set_id], player_udid: params[:udid])
  end
end