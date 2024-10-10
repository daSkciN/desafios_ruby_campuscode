require 'spec_helper'

describe JointAccount do
  it '1.Conta Conjunta possui nome, número e Conta Principal' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    expect(joint_account.name).to eq 'Ben Solo'
    expect(joint_account.number).to eq '02345-67'
  end

  it '2.Conta Conjunta compartilha saldo de Conta Principal' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    expect(joint_account.balance).to eq 100
    expect(joint_account.super_account).to eq super_account
  end

  it '3.Conta Conjunta debita de Conta Principal' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    joint_account.debit(10)

    expect(super_account.balance).to eq 90
    expect(joint_account.balance).to eq 90
  end

  it '4.Conta Conjunta não pode debitar quando saldo é insuficiente' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    expect(joint_account.debit(200)).to eq "Saldo insuficiente."
    expect(super_account.balance).to eq 100
    expect(joint_account.balance).to eq 100
  end

  it '5.Conta Conjunta deposita em Conta Principal' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    joint_account.deposit(10)

    expect(super_account.balance).to eq 110
    expect(joint_account.balance).to eq 110
  end

  it '6.Conta Conjunta não deve ser capaz de adicionar contas conjuntas' do
    super_account = BankAccount.new(name: 'Han Solo', number: '01234-56',
                                    balance: 100)
    joint_account = JointAccount.new(name: 'Ben Solo', number: '02345-67',
                                     super_account: super_account)

    response = joint_account.add_joint_account('Kylo Ren', '03456-78')

    expect(response).to eq "Conta Conjunta não pode adicionar outras " \
      "contas conjuntas: Kylo Ren, 03456-78"
  end
end
