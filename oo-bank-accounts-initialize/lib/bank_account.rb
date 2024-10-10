
class BankAccount
    attr_accessor :name, :number, :balance
    def initialize(name:, number:, balance: 0)
        @name = name
        @number = number
        @balance = balance
    end
end
