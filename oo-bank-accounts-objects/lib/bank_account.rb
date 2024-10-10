class BankAccount
  attr_reader :balance, :name, :number, :joint_accounts

  def initialize(name:, number:, balance: 0)
    @name = name
    @number = number
    @balance = balance
    @joint_accounts = []
  end

  def debit(value)
    return "Saldo insuficiente." if (@balance - value) < 0

    @balance -= value
  end

  def deposit(value)
    @balance += value
  end

  def add_joint_account(name, number)
    
    @joint_accounts << JointAccount.new(name: name, number: number, super_account: self)
    
  end
end
