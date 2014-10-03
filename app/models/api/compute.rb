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
      opp = @ey - @sy
      return Math.asin(opp/distance)*(180/Math::PI)
    end

    def velocity
      @vx/(Math.cos(theta*Math::PI/180)*(180/Math::PI))
    end

    def velocity_x
      velocity*Math.cos(theta*Math::PI/180)*(180/Math::PI)
    end

    def velocity_y
      velocity*Math.sin(theta*Math::PI/180)*(180/Math::PI)
    end

    def final_distance
      @vx*@time
    end

    def final_x
      final_distance*Math.cos(theta*Math::PI/180)*(180/Math::PI)
    end

    def final_y
      final_distance*Math.sin(theta*Math::PI/180)*(180/Math::PI)        
    end

    def x
      if (@sx < 0)
        (@sx - final_x).abs
      else
        (@sx + final_x).abs
      end
    end

    def y
      if (@sy < 0)
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
      # API::Compute.new(752.5, 976.5, 594, 844.5, -2368.45, -1670.883, 0.086).all
      # {
      #     time = "0.086";
      #     udid = "35367CD1-91AB-4BCC-AA2B-8A778EA97B5E";
      #     velocityX = "-2368.45";
      #     velocityY = "-1670.883";
      #     x1 = "752.5";
      #     x2 = 594;
      #     y1 = "976.5";
      #     y2 = "844.5";
      # }      
    end
  end
end