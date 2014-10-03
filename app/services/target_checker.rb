module TargetChecker
  P1_BASE = {x: [0..5], y: [0..5]}
  P2_BASE = {x: [91..96], y: [37..48]}
  RADIUS = 20
  class << self
    def get_state(x, y, game_set, player)
      target = nil
      opponents_base = game_set.p1_udid.eql?(player) ? P1_BASE : P2_BASE
      if hit_base?(x, y, opponents_base)
        target = "base"
      elsif hit_ship?(x, y, game_set)
        target = "ship"
      end
      hit = target.present?
      target
    end

    def hit_ship?(x, y, game_set)
      # Exact Point
      world = game_set.worlds.last
      exact = true if (x == world.x_coordinate && y == world.y_coordinate)

      # Circle Area
      circle1 = {radius: RADIUS, x: world.x_coordinate, y: world.y_coordinate}
      circle2 = {radius: RADIUS, x: x, y: y}
      dx = circle1.x - circle2.x
      dy = circle1.y - circle2.y
      distance = Math.sqrt(dx * dx + dy * dy)

      proximity = true if (distance < circle1.radius + circle2.radius)

      if world.present? && (exact || proximity)
        true
      end
    end

    def hit_base?(x,y, opponents_base)
      world = game_set.worlds.last
      if world.present? && opponents_base[:x].include?(x) && opponents_base[:y].include?(y)
        true 
      end
    end
  end
end