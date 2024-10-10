class BankAccount
  attr_reader :balance, :name, :number

  def initialize(name:, number:, balance: 0)
    @name = name
    @number = number
    @balance = balance
  end

  def debit(value)
    return "Saldo insuficiente." if (@balance - value) < 0

    @balance -= value
  end

  def deposit(value)
    @balance += value
  end
end
