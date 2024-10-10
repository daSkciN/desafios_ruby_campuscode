require 'spec_helper'

describe BinaryConverter do
  it '1: converte binário para inteiro' do
    expect(BinaryConverter.new.to_integer('00000100')).to eq 4
  end

  it '2: converte outro binario para inteiro' do
    expect(BinaryConverter.new.to_integer('1000100')).to eq 68
  end

  it '3: converte outro binario para inteiro' do
    expect(BinaryConverter.new.to_integer('110010000')).to eq 400
  end
end
