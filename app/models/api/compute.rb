module API
  class Compute
    def initialize(sx, sy, ex, ey, vx, vy, time)
      @sx = sx.to_f
      @sy = sy.to_f
      @ex = ex.to_f
      @ey = ey.to_f
      @vx = vx.to_f
      @vy = vy.to_f
      @time = time.to_f
    end

    def distance
      Math.sqrt((@ex - @sx)**2 + (@ey - @sy)**2)
    end

    def theta
      opp = (@ey - @sy).abs
      return Math.asin(opp/distance)*(180/Math::PI)
    end

    def velocity
      @vx/(Math.cos(theta*Math::PI/180)*(180/Math::PI))
    end

    def final_distance
      (velocity*@time).abs
    end

    def final_x
      final_distance*Math.cos(theta*Math::PI/180)*(180/Math::PI)
    end

    def final_y
      final_distance*Math.sin(theta*Math::PI/180)*(180/Math::PI)        
    end

    def x
      if (@vx < 0)
        (@sx - final_x).abs
      else
        (@sx + final_x).abs
      end
    end

    def y
      if (@vy < 0)
        (@sy - final_y).abs
      else
        (@sy + final_y).abs
      end      
    end

    def final_coordinates
      {x: x, y: y}
    end

    def all
      puts "Distance: #{distance}"
      puts "Theta: #{theta}"
      puts "Velocity: #{velocity}"
      puts "Velociy X: #{@vx}"
      puts "Velociy Y: #{@vy}"
      puts "Final Distance: #{final_distance}"
      puts "Final X: #{final_x}"
      puts "Final Y: #{final_y}"
      puts "X: #{x}"
      puts "Y: #{y}"
    end
  end
end