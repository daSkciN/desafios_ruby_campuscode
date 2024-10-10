require 'combatant'

class SuperSmashCampus
  def initialize(combatants, events)
    @combatants = combatants
    @events = events
    
  end

  def adventure!
    @events.split("\n").each do |event|
      if event.start_with?("Luta: ")
        match = event.match(/Luta: (.+) vs (.+), (.+) vence/)
        fighter1_event = match[1]
        fighter2_event = match[2]
        winner = match[3]
        fighter1 = @combatants.find{|combatant| combatant.name == fighter1_event}
        fighter2 = @combatants.find{|combatant| combatant.name == fighter2_event}
        fighter1_level_back = fighter1.level
        fighter2_level_back = fighter2.level
        if winner == fighter1_event
          fighter1.add_victory_exp(fighter2_level_back)
          fighter2.add_defeat_exp(fighter1_level_back)
        else
          fighter2.add_victory_exp(fighter1_level_back) 
          fighter1.add_defeat_exp(fighter2_level_back)          
        end
      
      elsif event.start_with?("Treino: ")
        match = event.match(/Treino: (.+), (\d+)(?:xp|exp)/)
        fighter1_event = match[1]
        exp_event = match[2].to_i
        fighter1 = @combatants.find{|combatant| combatant.name == fighter1_event}
        fighter1.add_training_exp(exp_event)
      end
    end
  end
end