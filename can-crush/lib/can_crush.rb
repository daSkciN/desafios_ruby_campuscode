class CanCrush
  def initialize(wall_of_cans)
    @wall_of_cans = wall_of_cans
  end

  def throw(rocks)
    rocks.each do |rock|
      location = rock[1] 
      dmg = rock[0]
      @wall_of_cans.each do |row|
        if row[location] > 0
          if row[location] >= dmg
            row[location] -= dmg
            break
          else
            dmg -= row[location]
            row[location] = 0
          end
        end       
      end
    end
  return @wall_of_cans
  end
end
