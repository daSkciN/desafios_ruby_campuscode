require 'spec_helper'

describe Character do
  it '1. Personagem é inicializado com atributos' do
    character = Character.new('SPAGHETTOMON', 'italiana', 12, 130)

    expect(character.name).to eq 'SPAGHETTOMON'
    expect(character.type).to eq 'italiana'
    expect(character.strength).to eq 12
    expect(character.life).to eq 130
  end

  it '2. Personagem pode atacar outro personagem' do
    character = Character.new('SUSHIMON', 'japonesa', 10, 130)
    other_character = Character.new('SASHIMIMON', 'japonesa', 11, 150)

    character.attack(other_character)

    expect(other_character.life).to eq 140
  end

  it '3. Personagem pode ser nocauteado ao ficar com vida 0' do
    character = Character.new('SUSHIMON', 'japonesa', 20, 130)
    other_character = Character.new('SASHIMIMON', 'japonesa', 11, 15)

    character.attack(other_character)

    expect(other_character.life).to eq 0
  end

  it '4. Personagem pode curar outro personagem' do
    character = Character.new('SUSHIMON', 'japonesa', 10, 130)
    other_character = Character.new('SASHIMIMON', 'japonesa', 11, 150)

    character.attack(other_character)
    character.attack(other_character)
    character.heal(other_character)

    expect(other_character.life).to eq 140
  end

  it '5. Personagem não pode ser curado se estiver nocauteado' do
    character = Character.new('SUSHIMON', 'japonesa', 20, 130)
    other_character = Character.new('SASHIMIMON', 'japonesa', 11, 15)

    character.attack(other_character)
    character.heal(other_character)

    expect(other_character.life).to eq 0
  end

  it '6. Personagem não pode ser curado além da sua vida máxima' do
    character = Character.new('SUSHIMON', 'japonesa', 10, 130)
    other_character = Character.new('SASHIMIMON', 'japonesa', 11, 150)

    character.attack(other_character)
    character.heal(other_character)
    character.heal(other_character)

    expect(other_character.life).to eq 150
  end

  context '7. Ataques em personagens fracos para seu tipo recebem 50% a mais de dano' do
    it 'japonesa é fraco contra italiana' do
      character = Character.new('LASANHAMON','italiana', 10, 130)
      other_character = Character.new('SUSHIMON', 'japonesa', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 135
    end

    it 'junina é fraco contra japonesa' do
      character = Character.new('SUSHIMON','japonesa', 10, 130)
      other_character = Character.new('PAMONHAMON', 'junina', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 135
    end

    it 'italiana é fraco contra junina' do
      character = Character.new('PAMONHAMON','junina', 10, 130)
      other_character = Character.new('LASANHAMON', 'italiana', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 135
    end
  end

  context '8. Recebem 50% a menos de dano se for resistente ao tipo' do
    it 'japonesa é resistente a junina' do
      character = Character.new('PAMONHAMON','junina', 10, 130)
      other_character = Character.new('SUSHIMON', 'japonesa', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 145
    end

    it 'junina é resistente a italiana' do
      character = Character.new('LASANHAMON','italiana', 10, 130)
      other_character = Character.new('PAMONHAMON', 'junina', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 145
    end

    it 'italiana é resistente a japonesa' do
      character = Character.new('SUSHIMON','japonesa', 10, 130)
      other_character = Character.new('LASANHAMON', 'italiana', 11, 150)

      character.attack(other_character)

      expect(other_character.life).to eq 145
    end
  end
end
