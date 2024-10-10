require 'spec_helper'

describe SortingChairs do
  it '1. Organiza fileira com 2 pessoas' do
    rules = <<~RULES
    MARINA senta à esquerda de MAX
    RULES

    expect(SortingChairs.new(rules).sort).to eq ['MARINA', 'MAX']
  end

  it '2. Organiza fileira com 3 pessoas' do
    rules = <<~RULES
    PEDRO sempre senta no meio
    MARINA senta à direita de MAX
    RULES

    expect(SortingChairs.new(rules).sort).to eq ['MAX', 'PEDRO', 'MARINA']
  end

  it '3. Organize fileira com 3 pessoas' do
    rules = <<~RULES
    PEDRO não senta no meio
    MARINA senta à esquerda de MAX
    MARINA não senta ao lado de PEDRO
    RULES

    expect(SortingChairs.new(rules).sort).to eq ['MARINA', 'MAX', 'PEDRO']
  end

  it '4. Conjunto de regras não aplicável' do
    rules = <<~RULES
    MARINA senta à esquerda de MAX
    MAX senta à esquerda de MARINA
    RULES

    expect(SortingChairs.new(rules).sort).to eq 'Impossível aplicar todas as regras'
  end

  it '5. Organiza fileira com 5 pessoas' do
    rules = <<~RULES
    JOANA sempre senta ao lado de ANTÔNIO
    ANTÔNIO senta à esquerda de GABRIEL
    RICARDO sempre senta no meio
    ANA não senta no meio
    ANA não senta ao lado de RICARDO
    GABRIEL sempre senta no meio
    RULES

    expect(SortingChairs.new(rules).sort).to include ['JOANA', 'ANTÔNIO', 'RICARDO', 'GABRIEL', 'ANA']
    expect(SortingChairs.new(rules).sort).to include ['ANTÔNIO', 'JOANA', 'RICARDO', 'GABRIEL', 'ANA']
    expect(SortingChairs.new(rules).sort.size).to eq 2
  end

  it '6. Conjunto de regras não aplicável' do
    rules = <<~RULES
    JOANA sempre senta ao lado de ANTÔNIO
    ANTÔNIO senta à esquerda de GABRIEL
    RICARDO sempre senta no meio
    ANA não senta no meio
    ANA não senta ao lado de RICARDO
    GABRIEL sempre senta no meio
    GABRIEL não senta ao lado de ANA
    RULES

    expect(SortingChairs.new(rules).sort).to eq 'Impossível aplicar todas as regras'
  end

  it '7. Organiza fileira com 7 pessoas' do
    rules = <<~RULES
    LUCAS sempre senta no meio
    CAIO não senta ao lado de LUIZ
    MARIO não senta ao lado de LAURA
    LUIZ senta à esquerda de LAURA
    MARIO sempre senta ao lado de CAIO
    LAURA não senta no meio
    LAURA não senta ao lado de LEO
    CAIO senta à direita de LUCAS
    MARINA senta à esquerda de LEO
    LEO não senta ao lado de CAIO
    MARINA sempre senta no meio
    RULES

    expect(SortingChairs.new(rules).sort).to include ["LUIZ", "LUCAS", "MARINA", "LEO", "MARIO", "CAIO", "LAURA"]
    expect(SortingChairs.new(rules).sort).to include ["LUIZ", "MARINA", "LUCAS", "LEO", "MARIO", "CAIO", "LAURA"]
    expect(SortingChairs.new(rules).sort).to include ["LUIZ", "MARINA", "LEO", "LUCAS", "MARIO", "CAIO", "LAURA"]
    expect(SortingChairs.new(rules).sort.size).to eq 3
  end
end
