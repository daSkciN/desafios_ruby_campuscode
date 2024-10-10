require 'spec_helper'

describe BankAccount do
  it '1.Conta Bancária deve ter nome, número, categoria e saldo' do
    name = 'Han Solo'
    number = '01234-56'
    account = BankAccount.new(name: name, number: number, balance: 10)

    expect(account.name).to eq 'Han Solo'
    expect(account.number).to eq '01234-56'
    expect(account.balance).to eq 10
  end

  it '2.Conta Bancária deve ter saldo com valor ZERO por padrão' do
    name = 'Han Solo'
    number = '01234-56'
    account = BankAccount.new(name: name, number: number)

    expect(account.balance).to eq 0
  end
end
