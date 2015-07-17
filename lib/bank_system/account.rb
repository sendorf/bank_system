module BankSystem
	class Account

	  attr_reader :balance, :owner

	  def initialize( balance, owner )
	    @balance = balance
	    @owner = owner
	  end
	end
end