class TheLastOfUs
  def initialize(city_map, paths, infection_rate)
    @city_map = city_map
    @paths = paths
    @infection_rate = infection_rate
    @locations = {}
  end

  def infection_monitoring
    @city_map.each_line do |line|
      if line.start_with?("Base: ")
        base_location = line.split(":").last.strip
        base_value = base_location.split(",").map(&:to_i)
        @locations["Base"] = base_value    
      else                                                                         
        name = line.split(":").first.strip
        value = line.split(":").last.strip.split(",").map(&:to_i)
        @locations[name] = value       
      end
    end
    best_path = ""
    min_infection = Float::INFINITY
    @paths.each_line do |line|
      path = line.strip.split(" -> ")
      infection = 0
      initial_position = @locations["Base"]
      path.each do |path_loc|
        walk_to = @locations[path_loc]
        distance = Math.sqrt((walk_to[0] - initial_position[0])**2 + (walk_to[1] - initial_position[1])**2)
        infection += (distance * @infection_rate).to_i
        initial_position = walk_to     
        if path_loc == "Base"
          infection /= 2
        end   
      end     
      if infection < min_infection
        min_infection = infection
        best_path = path.join(" -> ")
      end
    end
    return "O melhor trajeto é #{best_path}, com #{min_infection} de nível de infecção" 
  end
end
