module BankSystem
	class Bank

		attr_reader :accounts

		def initialize
			@accounts = []
		end

		def add_account account
			self.accounts << account
		end
	end
end