require 'spec_helper'

describe SuperSmashCampus do
  it '1. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    marth = Combatant.new('Marth', 10)
    sheik = Combatant.new('Sheik', 10)
    rosalina = Combatant.new('Rosalina', 110)
    combatants = [marth, rosalina, sheik]

    events = <<~EVENTS
      Luta: Marth vs Sheik, Marth vence
      Luta: Marth vs Rosalina, Marth vence
    EVENTS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(marth.exp).to eq(210)
    expect(marth.level).to eq(21)
  end

  it '2. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    marth = Combatant.new('Marth', 112)
    snake = Combatant.new('Snake', 110)
    lucina = Combatant.new('Lucina', 200)
    combatants = [marth, snake, lucina]

    events = <<~EVENTOS
      Luta: Snake vs Marth, Marth vence
      Luta: Snake vs Lucina, Lucina vence
    EVENTOS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(snake.exp).to eq(230)
    expect(snake.level).to eq(23)
  end

  it '3. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    pacman = Combatant.new('Pac Man', 120)
    sora = Combatant.new('Sora', 123)
    yoshi = Combatant.new('Yoshi', 245)
    combatants = [pacman, sora, yoshi]

    events = <<~EVENTOS
      Luta: Pac Man vs Sora, Sora vence
      Treino: Pac Man, 70exp
      Luta: Pac Man vs Yoshi, Yoshi vence
    EVENTOS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(pacman.exp).to eq(290)
    expect(pacman.level).to eq(29)
    expect(sora.exp).to eq(223)
    expect(sora.level).to eq(22)
    expect(yoshi.exp).to eq(345)
    expect(yoshi.level).to eq(34)
  end

  it '4. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    yoshi = Combatant.new('Yoshi', 10)
    combatants = [yoshi]

    events = <<~EVENTS
                Treino: Yoshi, 10exp
                Treino: Yoshi, 20exp
                Treino: Yoshi, 5exp
                Treino: Yoshi, 5exp
                Treino: Yoshi, 30exp
              EVENTS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(yoshi.exp).to eq(80)
    expect(yoshi.level).to eq(8)
  end

  it '5. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    link = Combatant.new('Link', 100)
    sephirot = Combatant.new('Sephirot', 110)
    zelda = Combatant.new('Zelda', 200)
    bowser_jr = Combatant.new('Bowser Jr', 400)
    pit = Combatant.new('Pit', 600)
    combatants = [link, sephirot, zelda, bowser_jr, pit]

    events = <<~EVENTS
                Luta: Link vs Sephirot, Link vence
                Luta: Link vs Zelda, Link vence
                Luta: Link vs Bowser Jr, Link vence
                Luta: Link vs Pit, Link vence
              EVENTS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(link.exp).to eq(630)
    expect(link.level).to eq(63)
    expect(sephirot.exp).to eq(155)
    expect(sephirot.level).to eq(15)
    expect(zelda.exp).to eq(250)
    expect(zelda.level).to eq(25)
    expect(bowser_jr.exp).to eq(400)
    expect(bowser_jr.level).to eq(40)
    expect(pit.exp).to eq(600)
    expect(pit.level).to eq(60)
  end

  it '6. Recebe lutador e eventos e deve retornar as informações sobre o lutador ao fim dos eventos' do
    mewtwo = Combatant.new('Mewtwo', 310)
    incineroar = Combatant.new('Incineroar', 510)
    pikachu = Combatant.new('Pikachu', 450)
    jigglypuff = Combatant.new('Jigglypuff', 600)
    greninja = Combatant.new('Greninja', 760)
    combatants = [mewtwo, incineroar, pikachu, jigglypuff, greninja]

    events = <<~EVENTS
                Luta: Mewtwo vs Incineroar, Incineroar vence
                Treino: Mewtwo, 30xp
                Luta: Mewtwo vs Pikachu, Pikachu vence
                Treino: Mewtwo, 80xp
                Luta: Mewtwo vs Jigglypuff, Mewtwo vence
                Luta: Mewtwo vs Greninja, Mewtwo vence
                Luta: Mewtwo vs Incineroar, Mewtwo vence
              EVENTS

    SuperSmashCampus.new(combatants, events).adventure!

    expect(mewtwo.exp).to eq(830)
    expect(mewtwo.level).to eq(83)
    expect(incineroar.exp).to eq(720)
    expect(incineroar.level).to eq(72)
    expect(pikachu.exp).to eq(570)
    expect(pikachu.level).to eq(57)
    expect(jigglypuff.exp).to eq(650)
    expect(jigglypuff.level).to eq(65)
    expect(greninja.exp).to eq(780)
    expect(greninja.level).to eq(78)
  end
end
