class Card
  attr_reader :account, :purchases, :number

  def initialize(account:, number:)
    @account = account
    @number = number
    @purchases = []
  end

  def new_purchase(value, description)
    @purchases << "Compra: #{ description }; no valor de #{ value }."
  end
end

