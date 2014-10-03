class Api::GameSetsController < ApplicationController


  def load_game
    @game_set = GameSet.last
    render json: { set_id: @game_set.id, state: @game_set.state, winner: @game_set.winner }
  end

  def create
    @game_set = GameSet.create(
        p1_udid: params[:uid],
        state: "waiting"
    )
    render json: { set_id: @game_set.id, state: @game_set.state }
  end

  def update
    @game_set = GameSet.find(params[:id])
    @game_set.update_attributes(p2_udid: params[:udid], state: "active")
    render json: { set_id: @game_set.id, state: @game_set.state }
  end

end