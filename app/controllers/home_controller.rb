class HomeController < ApplicationController

  def poll
    @game_set = GameSet.last
  end

end