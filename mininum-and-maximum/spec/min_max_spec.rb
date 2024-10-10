require 'spec_helper'

describe MinMax do
  it '1. Recebe string de números e retorna Mínimo: 2; Máximo: 55' do
    expect(MinMax.new.find('12 36 2 13 54 55')).to eq 'Mínimo: 2; Máximo: 55'
  end

  it '2. Recebe string de números e retorna Mínimo: -3; Máximo: 524' do
    expect(MinMax.new.find('88 7 44 22 62 -3 524')).to eq 'Mínimo: -3; Máximo: 524'
  end

  it '3. Recebe string de letras e retorna Mínimo: mar; Máximo: paralelo' do
    expect(MinMax.new.find('campus paralelo lança pêra olho mar')).to eq 'Mínimo: mar; Máximo: paralelo'
  end

  it '4. Recebe string de letras e retorna Mínimo: um; Máximo: duzentos' do
    expect(MinMax.new.find('um dois duzentos rails campus mil brioche suflê')).to eq 'Mínimo: um; Máximo: duzentos'
  end

  it '5. Recebe string de letras e números e retorna Mínimo: 2; Máximo: macarronada' do
    expect(MinMax.new.find('pavê macarronada 2 asa 10 frango')).to eq 'Mínimo: 2; Máximo: macarronada'
  end

  it '6. Recebe string de letras e números e retorna Mínimo: vaca; Máximo: 7' do
    expect(MinMax.new.find('vaca macaco 5 6 águia peixe 7')).to eq 'Mínimo: vaca; Máximo: 7'
  end

  it '7. Recebe string de números e letras com empate e retorna Mínimo: asas; Máximo: 9' do
    expect(MinMax.new.find('4 cinco polvo estrela 9 asas')).to eq 'Mínimo: asas; Máximo: 9'
  end

  it '8. Recebe string de números e letras com empate e retorna Mínimo: 2; Máximo: estrela' do
    expect(MinMax.new.find('maça pó 7 quinze estrela 2 3')).to eq 'Mínimo: 2; Máximo: estrela'
  end

  it '9. Recebe string de números e letras com empate e retorna Mínimo: verde; Máximo: 23' do
    expect(MinMax.new.find('amarelo laranja 22 preto 5 23 verde cinza')).to eq 'Mínimo: verde; Máximo: 23'
  end
end
