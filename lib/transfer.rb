require 'bank_account'
class Transfer
  attr_reader :amount, :status, :sender, :receiver
  def initialize(sender_obj, receiver_obj, amount)
    @sender = sender_obj
    @receiver = receiver_obj
    @amount = amount
    @status = "pending"    
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if self.valid? && @sender.balance > self.amount && self.status == "pending"
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end    
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

  private

  def status= (status)
    @status = status
  end
    
end
