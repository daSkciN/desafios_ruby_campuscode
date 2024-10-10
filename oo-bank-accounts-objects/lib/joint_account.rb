class JointAccount < BankAccount
  attr_reader :super_account

  def initialize(name:, number:, super_account:)
    super(name: name, number: number)
    @super_account = super_account
  end

  def balance
    @super_account.balance
  end

  def debit(value)
    @super_account.debit(value)
  end

  def deposit(value)
    @super_account.deposit(value)
  end

  def add_joint_account(name, number)
    
    return "Conta Conjunta não pode adicionar outras contas conjuntas: #{name}, #{number}"
    
  end
end
