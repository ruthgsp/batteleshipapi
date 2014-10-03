module API
  class Compute
    def initialize(sx, sy, ex, ey, v, time)
      @sx = sx
      @sy = sy
      @ex = ex
      @ey = ey
      @v = v
      @time = time
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