class BankAccount
#the start of attr
    attr_reader :balance
    attr_accessor :transaction

    # def transaction=(items)
    #     @transaction = items
    # end

    # def transaction
    #     @transaction
    # end

    # def balance
    #     @balance
    # end

## end of attr_reader

class << self
    def created_for(firstname, lastname)
        @account ||= []
        @account << BankAccount.new(firstname,lastname)
    end

    def find_for(firstname, lastname)
        @account.find{|account| account.full_name == "#{firstname} #{lastname}"}
    end
end

## this is self

# def self.created_for(firstname, lastname)
#     @account ||= []
#     @account << BankAccount.new(firstname,lastname)
# end

# def self.find_for(firstname, lastname)
#     @account.find{|account| account.full_name == "#{firstname} #{lastname}"}
# end

## end of self


    def full_name
        "#{@firstname} #{@lastname}"
    end

    def initialize(firstname, lastname)
        @balance =0
        @firstname =firstname
        @lastname = lastname
    end

    def deposit(money)
        @balance += money
    end

    def widraw(money)
        @balance -= money
    end

    def call_reset_function
        reset!
    end

    def reset_other_balance(other_account)
        other_account.private_reset!
    end

    private
    def reset!
        @balance = 0
    end

    def private_reset!
        @balance = 0
    end

    protected
    def protected_reset!
        @balance = 0
    end

end
