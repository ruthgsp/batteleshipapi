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

end