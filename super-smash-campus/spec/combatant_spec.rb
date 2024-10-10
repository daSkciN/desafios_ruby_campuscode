require 'spec_helper'

describe Combatant do
  it 'instancia combatant com atributos' do
    combatant = Combatant.new('Marth', 100)

    expect(combatant.name).to eq 'Marth'
    expect(combatant.exp).to eq 100
    expect(combatant.level).to eq 10
  end

  it 'calcula nível com base na exp' do
    marth = Combatant.new('Marth', 100)
    sheik = Combatant.new('Sheik', 110)
    rosalina = Combatant.new('Rosalina', 117)

    expect(marth.level).to eq 10
    expect(sheik.level).to eq 11
    expect(rosalina.level).to eq 11
  end

  context 'soma experiência em vitória' do
    it 'contra mesmo nível' do
      marth = Combatant.new('Marth', 20)
      marth.add_victory_exp(2)

      expect(marth.exp).to eq 120
      expect(marth.level).to eq 12
    end

    it 'contra nível inferior' do
      marth = Combatant.new('Marth', 20)
      luigi = Combatant.new('Luigi', 10)
      marth.add_victory_exp(1)

      expect(marth.exp).to eq 115
      expect(marth.level).to eq 11
    end

    it 'contra nível superior' do
      marth = Combatant.new('Marth', 20)
      marth.add_victory_exp(4)

      expect(marth.exp).to eq 130
      expect(marth.level).to eq 13
    end
  end

  context 'soma experiência em derrota' do
    it 'contra mesmo nível' do
      marth = Combatant.new('Marth', 10)
      marth.add_defeat_exp(1)

      expect(marth.exp).to eq 60
      expect(marth.level).to eq 6
    end

    it 'contra nível inferior' do
      marth = Combatant.new('Marth', 20)
      marth.add_defeat_exp(1)

      expect(marth.exp).to eq 65
      expect(marth.level).to eq 6
    end

    it 'contra nível superior' do
      marth = Combatant.new('Marth', 10)
      marth.add_defeat_exp(4)

      expect(marth.exp).to eq 75
      expect(marth.level).to eq 7
    end
  end
end
