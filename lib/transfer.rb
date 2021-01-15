class Transfer
  attr_reader :amount, :sender, :reciever
  attr_accessor :status
  
  def intialize(amount, sender, reciever)
    @amount = amount
    @sender = sender
    @reciever = reciever
    @status = 'pending'
  end
  
  def valid?
    sender.valid? && reciever.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == 'pending'
      sender.balance -= amount
      reciever.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && reviever.balance > amount && self.status == 'complete'
      sender.balance -= amount
      reciever.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end





