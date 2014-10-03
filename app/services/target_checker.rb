module TargetChecker
  P1_BASE = {x: [0..5], y: [0..5]}
  P2_BASE = {x: [91..96], y: [37..48]}

  def get_state(x, y, game_set, player)
    target = nil
    opponents_base = P1_BASE ? game_set.p1_udid.eql?(player) : P2_BASE
    if hit_base?(x, y, opponents_base)
      target = "base"
    elsif hit_ship?(x, y, game_set)
      target = "ship"
    end
    hit = target.present?
    target
  end

  def hit_ship?(x, y, game_set)
    world = game_set.worlds.last
    true if x == world.x_coordinate && y == world.y_coordinate
  end

  def hit_base?(x,y, opponents_base)
    true if opponents_base[:x].include?(x) && opponents_base[:y].include?(y)
  end
end