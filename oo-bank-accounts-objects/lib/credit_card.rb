class CreditCard < Card
  def initialize(account:, number:, bill_date:)
    super(account: account, number: number)
    @bill_date = bill_date
  end

  def new_purchase(value, description)
    super(value + value * 0.12, description)
  end
end
