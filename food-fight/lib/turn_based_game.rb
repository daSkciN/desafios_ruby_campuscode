class TurnBasedGame
  def initialize(characters, gamelog)
    @characters = characters
    @gamelog = gamelog.split("\n")
  end

  def play
    output = []
    @gamelog.each do |log|
      match = log.match(/(.+) (.+) (.+)/)
      attacker_name = match[1]
      atk_def = match[2]
      defender_name = match[3]
      attacker = @characters.find { |char| char.name == attacker_name }
      defender = @characters.find { |char| char.name == defender_name }
      initial_life = defender.life

      if defender.life == 0
        output << "#{attacker_name} => #{defender_name}: nocauteado"
        next
      end

      if atk_def == 'ataca'
        attacker.attack(defender)
        real_damage = attacker.strength
        damage = [attacker.strength, initial_life].min 
        final_life = defender.life
        if final_life != 0
          output << "#{attacker_name} => #{defender_name}: #{initial_life.round} - #{damage.to_i} => #{final_life.round}"   
        elsif final_life == 0
          output << "#{attacker_name} => #{defender_name}: #{initial_life.round} - #{real_damage.to_int} => nocauteado"
        end
      elsif atk_def == 'cura'
        actual_heal = attacker.heal(defender)
        final_life = defender.life
        output << "#{attacker_name} => #{defender_name}: #{initial_life.round} + #{actual_heal.to_i} => #{final_life.round}" unless defender.life == 0
      end
    end
    return output.join("\n")
  end
end
