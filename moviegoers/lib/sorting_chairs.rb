class SortingChairs
  def initialize(rules)
    @rules = rules.split("\n")
    @seating = [] # Assentos inicialmente vazios
    @people = [] # Lista de pessoas
    @conflicts = [] # Lista de conflitos
  end

  def sort
    # Processa as regras
    @rules.each do |rule|
      if rule.include?('sempre senta no meio')
        person = rule.split.first
        allocate_middle(person)
      elsif rule.include?('senta à direita de')
        person, other_person = extract_right_of_rule(rule)
        allocate_right_of(person, other_person)
      elsif rule.include?('senta à esquerda de')
        person, other_person = extract_left_of_rule(rule)
        allocate_left_of(other_person, person)
      elsif rule.include?('não senta ao lado de')
        person, other_person = extract_not_next_to_rule(rule)
        @conflicts << [person, other_person]
      else
        person = rule.split.first
        @people << person unless @people.include?(person)
      end
    end

    # Verifica se a pessoa no meio está alocada
    verify_middle_person

    # Preenche os lugares restantes
    fill_remaining_seats

    # Verifica se há conflitos
    return 'Impossível aplicar todas as regras' if invalid_seating?

    @seating.compact # Remove posições nil e retorna a disposição final
  end

  # Aloca uma pessoa no meio da lista
  def allocate_middle(person)
    middle_index = (@seating.size / 2.0).floor
    @seating[middle_index] = person
  end

  # Aloca uma pessoa à direita de outra pessoa
  def allocate_right_of(person, other_person)
    if @seating.include?(other_person)
      right_of_index = @seating.index(other_person)
      @seating[right_of_index + 1] = person
    else
      # Adiciona temporariamente no fim para reposicionar depois
      @people << [person, other_person, :right]
    end
  end

  # Aloca uma pessoa à esquerda de outra pessoa
  def allocate_left_of(person, other_person)
    if @seating.include?(other_person)
      left_of_index = @seating.index(other_person)
      @seating[left_of_index] = person
    else
      # Adiciona temporariamente no fim para reposicionar depois
      @people << [person, other_person, :left]
    end
  end

  # Verifica se a pessoa que deve estar no meio está presente
  def verify_middle_person
    middle_person_rule = @rules.find { |rule| rule.include?('sempre senta no meio') }
    return if middle_person_rule.nil?

    middle_person = middle_person_rule.split.first
    middle_index = (@seating.size / 2.0).floor

    unless @seating[middle_index] == middle_person
      # Se não estiver, alocamos novamente no meio
      allocate_middle(middle_person)
    end
  end

  # Preenche os lugares restantes com as pessoas sem regras específicas
  def fill_remaining_seats
    pending_people = @people.select { |p| p.is_a?(Array) }
    pending_people.each do |person, other_person, direction|
      if @seating.include?(other_person)
        if direction == :right
          right_of_index = @seating.index(other_person)
          @seating[right_of_index + 1] = person
        else
          left_of_index = @seating.index(other_person)
          @seating[left_of_index] = person
        end
      else
        # Se o par ainda não foi alocado, coloca ambos
        @seating << other_person << person
      end
    end

    # Adicionar as pessoas que não têm regras de posição
    @people.reject { |p| p.is_a?(Array) }.each do |person|
      @seating << person unless @seating.include?(person)
    end
  end

  # Extrai a regra de "senta à direita de"
  def extract_right_of_rule(rule)
    person = rule.split.first
    other_person = rule.split('senta à direita de').last.strip
    [person, other_person]
  end

  # Extrai a regra de "senta à esquerda de"
  def extract_left_of_rule(rule)
    person = rule.split.first
    other_person = rule.split('senta à esquerda de').last.strip
    [person, other_person]
  end

  # Extrai a regra de "não senta ao lado de"
  def extract_not_next_to_rule(rule)
    person = rule.split.first
    other_person = rule.split('não senta ao lado de').last.strip
    [person, other_person]
  end

  # Verifica se há regras impossíveis de aplicar
  def invalid_seating?
    @conflicts.any? do |person, other_person|
      index_person = @seating.index(person)
      index_other_person = @seating.index(other_person)

      # Verifica se estão lado a lado
      index_person && index_other_person && (index_person - index_other_person).abs == 1
    end
  end
end
