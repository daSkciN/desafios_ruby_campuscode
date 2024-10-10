class DronePark
  def initialize(park_map)
    @park_map = park_map.split("\n")
  end

  def search(symbol)
    @symbol = symbol
    drones = []
    symbol_count = 0
    @park_map.each_with_index do |line,y|
      if symbol.empty?
        line.scan(/[A-Z]{2}\d{4}/) { |drone| drones << drone }
       
      end
      if line.include?(symbol)
        symbol_count += line.count(symbol)
        indices = line.chars.each_index.select { |i| line[i] == symbol }.reverse
        x = line.index(symbol)  
        indices.each do |x|
          near_positions = [
          [y, x + 1], 
          [y, x - 1],
          [y + 1, x],  
          [y - 1, x]   
          ]
        
          near_positions.each do |near_y,near_x|
            next if near_y < 0 || near_y >= @park_map.size || near_x < 0 || near_x + 1 >= @park_map[near_y].size
            if @park_map[near_y][near_x] =~ /[A-Z0-9]/
              start_index = near_x
              while start_index > 0 && @park_map[near_y][start_index - 1] =~ /[A-Z0-9]/
                start_index -= 1
              end
              end_index = near_x
              while end_index < @park_map[near_y].size && @park_map[near_y][end_index] =~ /[A-Z0-9]/ 
                end_index += 1
              end
              drone = @park_map[near_y][start_index...end_index]
              if drone =~ /^[A-Z]{2}\d{4}$/
                drones << drone
              end
            end
          end
        end
      end
    end
  return drones.uniq.sort
  end
end

