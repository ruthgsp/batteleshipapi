module API
  class Compute
    def initialize(sx, sy, ex, ey, v, time)
      @sx = sx.to_f
      @sy = sy.to_f
      @ex = ex.to_f
      @ey = ey.to_f
      @v = v.to_i
      @time = time.to_f
    end

    def distance
      Math.sqrt((@ex - @sx)**2 + (@ey - @sy)**2)
    end

    def theta
      opp = @ey - @sy
      return Math.asin(opp/distance)*(180/Math::PI)
    end

    def velocity
      @v/(Math.cos(theta*Math::PI/180)*(180/Math::PI))
    end

    def final_distance
      velocity*@time
    end

    def final_x
      @sx + final_distance*Math.cos(theta*Math::PI/180)*(180/Math::PI)
    end

    def final_y
      @sy + final_distance*Math.sin(theta*Math::PI/180)*(180/Math::PI)
    end

    def final_coordinates
      {x: final_x, y: final_y}
    end

    def all
      puts "Distance: #{distance}"
      puts "Theta: #{theta}"
      puts "Velocity: #{velocity}"
      puts "Final Distance: #{final_distance}"
      puts "Final X: #{final_x}"
      puts "Final Y: #{final_y}"
    end
  end
end