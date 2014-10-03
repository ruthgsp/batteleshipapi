class Api::GameSetsController < ApplicationController


  def load_game
    @game_set = GameSet.last
    if @game_set.present?
      render json: { set_id: @game_set.id, state: @game_set.state, winner: @game_set.winner }
    else
      render json: { success: false, state: "over" }
    end
  end

  def create
    @game_set = GameSet.new(
        p1_udid: params[:udid],
        state: "waiting"
    )
    
    if @game_set.save
      render json: { success: true, set_id: @game_set.id, state: @game_set.state }
    else
      render json: { success: false, errors_msg: @game_set.errors.message }
    end

  end

  def update
    @game_set = GameSet.find(params[:id])

    if @game_set.update_attributes(p2_udid: params[:udid], state: "active")
      render json: {success: true, set_id: @game_set.id, state: @game_set.state }
    else
      render json: {success: false }
    end
  end

  def active_player
    @game_set = GameSet.find params[:id]
    @world = @game_set.worlds.last
    if @world.present?
      if @world.player.eql?(params[:udid])
        render json: {success: true, active: false, x: @world.x_coordinate, y: @world.y_coordinate, hit: @world.hit_type}
      else
        render json: {success: true, active: true, x: @world.x_coordinate, y: @world.y_coordinate, hit: @world.hit_type}
      end
    else
      if @game_set.p1_udid.eql?(params[:udid])
        render json: {success: true, active: true, x: 48 , y: 96, hit: nil}
      else
        render json: {success: true, active: false, x: 0, y: 0, hit: nil}
      end
    end
  end

end