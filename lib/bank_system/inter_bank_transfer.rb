module BankSystem
	class InterBankTransfer < Transfer

		def initialize(sender, receiver, amount)
			super sender, receiver, amount
			raise "Error::NotAValidAmount" if amount > 1000
			@commission = 5.0
		end

	end
end