class DebitCard < Card
  def initialize(account:, number:)
    super(account: account, number: number)
  end

  def new_purchase(value, description)
    super(value, description)
    @account.debit(value)
  end
end
