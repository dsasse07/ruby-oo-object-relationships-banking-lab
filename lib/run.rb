require 'pry'
require 'require_all'
require_all './lib'



danny = BankAccount.new("Danny")
nicole = BankAccount.new("Nicole")

transfer1 = Transfer.new(danny, nicole, 100)
transfer2 = Transfer.new(danny, nicole, 100)

binding.pry