require 'spec_helper'

describe FileCalculator do
  it '1: converte arquivo binario e soma os números' do
    expect(FileCalculator.new.convert('data/file1.txt')).to eq 6367
  end

  it '2: converte outro arquivo binario e soma os números' do
    expect(FileCalculator.new.convert('data/file2.txt')).to eq 1202
  end

  it '3: converte outro arquivo binario e retorna o único número válido' do
    expect(FileCalculator.new.convert('data/file3.txt')).to eq 550
  end
end