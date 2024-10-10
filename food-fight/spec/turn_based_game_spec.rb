require 'spec_helper'

describe TurnBasedGame do
  it '1. Gera registro de saída com base no documento do jogo' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 200],
                          "PAMONHAMON": ["junina", 12, 160],
                          "SUSHIMON": ["japonesa", 15, 150] }
    characters = CharacterGenerator.new(characters_config).build
    gamelog = <<~GAMELOG
    SPAGHETTOMON ataca SUSHIMON
    GAMELOG

    game = TurnBasedGame.new(characters, gamelog)

    output = <<~OUTPUT.chomp
    SPAGHETTOMON => SUSHIMON: 150 - 15 => 135
    OUTPUT

    expect(game.play).to eq output
  end

  it '2. Gera registro de saída com múltiplos ataques' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 200],
                          "PAMONHAMON": ["junina", 12, 160],
                          "SUSHIMON": ["japonesa", 15, 150] }
    characters = CharacterGenerator.new(characters_config).build
    gamelog = <<~GAMELOG
    SPAGHETTOMON ataca SUSHIMON
    PAMONHAMON ataca SUSHIMON
    SUSHIMON ataca SPAGHETTOMON
    GAMELOG

    game = TurnBasedGame.new(characters, gamelog)

    output = <<~OUTPUT.chomp
    SPAGHETTOMON => SUSHIMON: 150 - 15 => 135
    PAMONHAMON => SUSHIMON: 135 - 6 => 129
    SUSHIMON => SPAGHETTOMON: 200 - 7 => 193
    OUTPUT

    expect(game.play).to eq output
  end

  it '3. Gera registro de saída com ataques e cura' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 200],
                          "PAMONHAMON": ["junina", 12, 160],
                          "SUSHIMON": ["japonesa", 15, 150] }
    characters = CharacterGenerator.new(characters_config).build
    gamelog = <<~GAMELOG
    SPAGHETTOMON ataca SUSHIMON
    PAMONHAMON cura SUSHIMON
    SPAGHETTOMON ataca SUSHIMON
    GAMELOG

    game = TurnBasedGame.new(characters, gamelog)

    output = <<~OUTPUT.chomp
    SPAGHETTOMON => SUSHIMON: 150 - 15 => 135
    PAMONHAMON => SUSHIMON: 135 + 12 => 147
    SPAGHETTOMON => SUSHIMON: 147 - 15 => 132
    OUTPUT

    expect(game.play).to eq output
  end

  it '4. Gera registro de saída com grande sequência de ações' do
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 200],
                          "SASHIMIMON": ["japonesa", 12, 160],
                          "PAMONHAMON": ["junina", 12, 160],
                          "LASANHOMON": ["italiana", 13, 110],
                          "MUNGUZAMON": ["junina", 20, 100],
                          "SUSHIMON": ["japonesa", 15, 150] }
    characters = CharacterGenerator.new(characters_config).build
    gamelog = <<~GAMELOG
    PAMONHAMON ataca SUSHIMON
    LASANHOMON cura SUSHIMON
    SPAGHETTOMON ataca PAMONHAMON
    MUNGUZAMON cura LASANHOMON
    SUSHIMON ataca MUNGUZAMON
    SPAGHETTOMON ataca MUNGUZAMON
    MUNGUZAMON ataca SASHIMIMON
    PAMONHAMON cura SASHIMIMON
    LASANHOMON ataca SPAGHETTOMON
    MUNGUZAMON ataca LASANHOMON
    SASHIMIMON cura LASANHOMON
    SUSHIMON ataca MUNGUZAMON
    SASHIMIMON ataca MUNGUZAMON
    SPAGHETTOMON ataca PAMONHAMON
    LASANHOMON ataca PAMONHAMON
    PAMONHAMON cura PAMONHAMON
    SUSHIMON ataca MUNGUZAMON
    SASHIMIMON ataca MUNGUZAMON
    SPAGHETTOMON cura PAMONHAMON
    LASANHOMON ataca SPAGHETTOMON
    PAMONHAMON ataca MUNGUZAMON
    SPAGHETTOMON cura MUNGUZAMON
    GAMELOG

    game = TurnBasedGame.new(characters, gamelog)
    characters_config = { "SPAGHETTOMON": ["italiana", 10, 200],
                          "SASHIMIMON": ["japonesa", 12, 160],
                          "PAMONHAMON": ["junina", 12, 160],
                          "LASANHOMON": ["italiana", 13, 110],
                          "MUNGUZAMON": ["junina", 20, 100],
                          "SUSHIMON": ["japonesa", 15, 150] }

    output = <<~OUTPUT.chomp
    PAMONHAMON => SUSHIMON: 150 - 6 => 144
    LASANHOMON => SUSHIMON: 144 + 6 => 150
    SPAGHETTOMON => PAMONHAMON: 160 - 5 => 155
    MUNGUZAMON => LASANHOMON: 110 + 0 => 110
    SUSHIMON => MUNGUZAMON: 100 - 22 => 78
    SPAGHETTOMON => MUNGUZAMON: 78 - 5 => 73
    MUNGUZAMON => SASHIMIMON: 160 - 10 => 150
    PAMONHAMON => SASHIMIMON: 150 + 10 => 160
    LASANHOMON => SPAGHETTOMON: 200 - 13 => 187
    MUNGUZAMON => LASANHOMON: 110 - 30 => 80
    SASHIMIMON => LASANHOMON: 80 + 12 => 92
    SUSHIMON => MUNGUZAMON: 73 - 22 => 51
    SASHIMIMON => MUNGUZAMON: 51 - 18 => 33
    SPAGHETTOMON => PAMONHAMON: 155 - 5 => 150
    LASANHOMON => PAMONHAMON: 150 - 6 => 144
    PAMONHAMON => PAMONHAMON: 144 + 12 => 156
    SUSHIMON => MUNGUZAMON: 33 - 22 => 11
    SASHIMIMON => MUNGUZAMON: 11 - 18 => nocauteado
    SPAGHETTOMON => PAMONHAMON: 156 + 4 => 160
    LASANHOMON => SPAGHETTOMON: 187 - 13 => 174
    PAMONHAMON => MUNGUZAMON: nocauteado
    SPAGHETTOMON => MUNGUZAMON: nocauteado
    OUTPUT

    expect(game.play).to eq output
  end
end

