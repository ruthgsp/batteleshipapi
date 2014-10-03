class Api::WorldsController < ApplicationController


  def create
    @game_set = GameSet.find(params[:game_set_id])
    #get coordinates
    coordinates = {x: 5, y: 5}
    #check if hit or miss
    target = TargetChecker.get_state(coordinates[:x], coordinates[:y], @game_set,  params[:udid])
    #update gameset
    @game_set.update_attributes(state: 'over', winner: params[:udid]) if target.eql?("base")

    @world = @game_set.worlds.new(
        player_udid: params[:udid],
        x_coordinate: coordinates[:x],
        y_coordinate: coordinates[:y],
        hit_type: target
    )

    if @world.save?
      render json: {success: true, x: @world.x_coordinate, y: y_coordinate, player: @world.player_uid, hit: @world.hit_type, game_set: @game_set.id}
    else
      render json: {success: false, error_msg: @world.errors.messages}
    end
  end
end