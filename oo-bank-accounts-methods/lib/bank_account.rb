class BankAccount
  attr_reader :balance, :name, :number

  def initialize(name:, number:, balance: 0)
    @name = name
    @number = number
    @balance = balance
  end

  def debit(value)
    if @balance >= value
      @balance -= value
    else 
      return 'Saldo insuficiente.'
    end
  end

  def deposit(value)
    @balance += value
  end
end
