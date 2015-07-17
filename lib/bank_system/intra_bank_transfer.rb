module BankSystem
	class IntraBankTransfer < Transfer

		def initialize(sender, receiver, amount)
			super sender, receiver, amount
			@commission = 0.0
		end

	end
end