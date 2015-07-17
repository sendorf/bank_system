module BankSystem
	class Transfer
		attr_reader :sender, :receiver, :amount, :commission

		def initialize(sender, receiver, amount)
			@sender = sender
			@receiver = receiver
			@amount = amount
		end

	end
end