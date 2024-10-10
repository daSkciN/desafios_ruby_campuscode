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

  it '3.Conta Bancária deve adicionar valor ao saldo' do
    name = 'Han Solo'
    number = '01234-56'
    account = BankAccount.new(name: name, number: number, balance: 0)

    account.deposit(100)

    expect(account.balance).to eq 100
  end

  it '4.Conta Bancária deve debitar valor do saldo' do
    name = 'Han Solo'
    number = '01234-56'
    account = BankAccount.new(name: name, number: number, balance: 100)

    account.debit(45)

    expect(account.balance).to eq 55
  end

  it '5.Conta Bancária não pode debitar quando saldo é insuficiente' do
    name = 'Han Solo'
    number = '01234-56'
    account = BankAccount.new(name: name, number: number, balance: 50)

    expect(account.debit(60)).to eq "Saldo insuficiente."
    expect(account.balance).to eq 50
  end
end
