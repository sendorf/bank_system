module BankSystem
	class Account

	  attr_reader :owner
	  attr_accessor :balance

	  def initialize( balance, owner )
	    @balance = balance
	    @owner = owner
	  end
	end
end