class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid? 
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end
  end
  
  def execute_transaction 
    if @sender.balance < @amount && sender.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit(@amount * -1) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
end
