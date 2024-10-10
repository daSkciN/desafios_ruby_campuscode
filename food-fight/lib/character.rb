class Character
  attr_reader :name, :type, :strength, :life
  def initialize(name, type, strength, life)
    @name = name
    @type = type
    @strength = strength
    @life = life
    @max_life = life
    @base = strength
  end

  WEAKNESSES = {
    'japonesa' => 'italiana',
    'italiana' => 'junina',
    'junina' => 'japonesa'
  }

  RESISTENCE = {
    'italiana' => 'japonesa',
    'junina' => 'italiana',
    'japonesa' => 'junina'
  }
  
  def attack(other_character)
    @strength = @base
    if WEAKNESSES[other_character.type] == @type
      other_character.take_damage((@strength * 1.5).floor)
      @strength *= 1.5
    elsif RESISTENCE[other_character.type] == @type
      other_character.take_damage(@strength * 0.5)
      @strength *= 0.5
    else
      other_character.take_damage(@strength)
    end
  end

  def take_damage(strength)
    if @life > strength
      @life -= strength
    else
      @life = 0
    end
  end

  def heal(other_character)
    if other_character.life == 0
      return 0 
    end
    @strength = @base
    actual_heal = [@strength, other_character.max_life - other_character.life].min
    other_character.take_heal(actual_heal)
    actual_heal 
  end

  def take_heal(heal_amount)
    @life += heal_amount
    @life = [@life, @max_life].min
  end



  attr_reader :max_life
end
