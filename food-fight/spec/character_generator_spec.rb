require 'spec_helper'

describe CharacterGenerator do
  it '1. Gera um personagem com atributos de configuração' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 20] }
    characters = CharacterGenerator.new(characters_config).build

    expect(characters.size).to eq 1
    expect(characters.first).to be_a Character
    expect(characters.first.name).to eq 'SPAGHETTOMON'
  end

  it '2. Gera vários personagens com atributos de configuração' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 20],
                          "SUSHIMON": ["japonesa", 15, 15],
                          "LASANHOMON": ["junina", 12, 13] }
    characters = CharacterGenerator.new(characters_config).build

    expect(characters.size).to eq 3
    expect(characters.first).to be_a Character
    expect(characters.first.name).to eq 'SPAGHETTOMON'
    expect(characters[-2].name).to eq 'SUSHIMON'
    expect(characters.last.name).to eq 'LASANHOMON'
  end
end
