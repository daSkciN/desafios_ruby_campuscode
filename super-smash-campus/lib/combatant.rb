class Combatant
  def initialize(name, exp)
    @name = name
    @exp = exp
  end

  def name
    name = @name
  end

  def exp
    exp = @exp
  end

  def level
    level = @exp/10
    @level = level
  end

  def add_victory_exp(level_adv)
    if level_adv == level
      @exp += 100
    elsif level_adv < level
      @exp += [100 - ((level - level_adv) * 5), 0].max
    elsif level_adv > level
      @exp += 100 + ((level_adv - level) * 5)
    end
  end

  def add_defeat_exp(level_adv)
    if level_adv == level
      @exp += 50
    elsif level_adv < level
      @exp += [50 - ((level - level_adv) * 5), 0].max
    elsif level_adv > level
      @exp += 50 + ((level_adv - level) * 5)
    end
  end

  def add_training_exp(exp)
    @exp += exp
  end
end