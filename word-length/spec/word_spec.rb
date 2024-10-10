require 'spec_helper'

describe Word do
  context '#shortest' do
    it '1. Busca a palavra mais curta na frase e retorna a palavra: os' do
      phrase = 'São tempos difíceis para os sonhadores'

      expect(Word.new.shortest(phrase)).to eq 'os'
    end

    it '2. Busca a palavra mais curta na frase e retorna a palavra: Eu' do
      phrase = 'Eu sei correr sem você precisar segurar minha mão'

      expect(Word.new.shortest(phrase)).to eq 'Eu'
    end

    it '3. Busca a palavra mais curta numa frase que apresenta empate e retorna a palavra: faz' do
      phrase = 'Meu mundo você é quem faz'

      expect(Word.new.shortest(phrase)).to eq 'faz'
    end

    it '4. Busca a palavra mais curta numa frase que apresenta empate e retorna a palavra: pra' do
      phrase = 'Que o nosso amor pra sempre viva, minha dádiva'

      expect(Word.new.shortest(phrase)).to eq 'pra'
    end
  end

  context '#longest' do
    it '1. Busca a palavra mais longa na frase e retorna a palavra: inabilidade' do
      phrase = 'Não confunda meu desejo de evitar violência com a inabilidade de a enfrentar'

      expect(Word.new.longest(phrase)).to eq 'inabilidade'
    end

    it '2. Busca a palavra mais longa na frase e retorna a palavra: tentativas' do
      phrase = 'Minha coragem sempre aumenta com todas as tentativas de me intimidar'

      expect(Word.new.longest(phrase)).to eq 'tentativas'
    end

    it '3. Busca a palavra mais longa numa frase que apresenta empate e retorna a palavra: mesmo' do
      phrase = 'Não se pode pisar duas vezes no mesmo rio'

      expect(Word.new.longest(phrase)).to eq 'mesmo'
    end

    it '4. Busca a palavra mais longa numa frase que apresenta empate e retorna a palavra: dançando' do
      phrase = 'E aqueles que foram vistos dançando foram julgados insanos por aqueles que não podiam escutar a música'

      expect(Word.new.longest(phrase)).to eq 'dançando'
    end
  end
end
