#reference of symbol :
#http://www.troubleshooters.com/codecorn/ruby/symbols.htm
#http://rubylearning.com/satishtalim/ruby_symbols.html
require 'date'

class BankAccount
    def initialize(name)
        @name = name
        @transactions = []
    end

    def deposit(amount, options={})
        options[:memo] ||= 'Regular Deposit'
        @transactions.push({:amount => amount, :memo => options[:memo]})
    end
end


bank_account= BankAccount.new("Yasin")
bank_account.deposit(100)
bank_account.deposit(100,{:memo=> "this is a gift "})
puts bank_account.inspect
#date


tanggal = Date.new(2016, 10 ,23)
puts tanggal.inspect
puts tanggal.strftime("%m/%d/%Y")
puts tanggal.day
puts tanggal.mday
puts tanggal.month

tanggal2 = Date.parse('2016-8-20')

selisih=tanggal - tanggal2
puts selisih.inspect

time = Time.new

puts time.inspect
#https://ruby-doc.org/core-2.1.0/Enumerable.html
class BankAccountEnum
    attr_reader :transactions
    include Enumerable
    include Comparable

    def <=>other_balance
        self.balance <=> other_balance
    end

    def initialize(name)
        @name = name
        @balance=0
        @transactions = []
    end

    def deposit(amount, options={})
        @transactions.push(amount)
    end

    def withdraw(amount)
        @transactions.push(-amount)
    end

    def balance
        @transactions.inject(0){ |sum,iterator| sum += iterator}
    end

    def each
        @transactions.each{|transaction| yield transaction}
    end

    def to_s
        "<#{self.class}:name: #{@name}, balance: #{balance}>"
    end
end


#Enumerable
account1= BankAccountEnum.new("Muhammad Yasin")
account1.deposit(100)
account1.withdraw(50)
account1.deposit(40)
account1.withdraw(20)
account1.each do |transaction|
    puts transaction
end



account2= BankAccountEnum.new("Miranty lestari")
account2.deposit(200)



accounts=[]
accounts.push(account2)
accounts.push(account1)

#puts accounts.sort #rubyCores.rb:98:in `sort': comparison of BankAccountEnum with BankAccountEnum failed (ArgumentError) from rubyCores.rb:98:in `<main>'

puts accounts.inspect


#Comparable
account3=BankAccountEnum.new("Arkan Zafran")
account3.deposit(50)

account4=BankAccountEnum.new("Millenium Account")
account4.deposit(150)

account5=BankAccountEnum.new("anonymous Account")
account5.deposit(200)

puts "is account 4 is greater than account 3? #{account4 > account3}"

#between
puts "is account 4 is between account 3 and 5?  #{account4.between?(account3,account5)}"
#IO


#Stuct
