module TargetChecker
  P1_BASE = {x: [0..5], y: [0..5]}
  P2_BASE = {x: [91..96], y: [37..48]}
  RADIUS = 20
  class << self
    def get_state(x, y, game_set, player)
      target = "miss"
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
      if world.present?
        if (x == world.x_coordinate && y == world.y_coordinate)
          exact = true 
        else
          # Circle Area
          circle1 = {radius: RADIUS, x: world.x_coordinate, y: world.y_coordinate}
          circle2 = {radius: RADIUS, x: x, y: y}

          dx = circle1[:x] - circle2[:x]
          dy = circle1[:y] - circle2[:y]
          distance = Math.sqrt(dx * dx + dy * dy)

          proximity = true if (distance < circle1[:radius] + circle2[:radius])

          if world.present? && (exact || proximity)
            true
          end        
        end
      end
    end

    def hit_base?(x,y, opponents_base)
      base1 = circle_area(0, 0, x, y)
      base2 = circle_area(1536/2, 2048/2, x, y)

      if base1 || base2
        true 
      end
    end

    def circle_area(baseX, baseY, x, y)
      circle1 = {radius: 40, x: baseX, y: baseY}
      circle2 = {radius: 40, x: x, y: y}

      dx = circle1[:x] - circle2[:x]
      dy = circle1[:y] - circle2[:y]
      distance = Math.sqrt(dx * dx + dy * dy)   

      if (distance < circle1[:radius] + circle2[:radius])
        true
      else
        false
      end
    end
  end
end