module BankSystem
	class Bank

		attr_reader :accounts, :transfers

		def initialize
			@accounts = []
			@transfers = []
		end

		def add_account account
			self.accounts << account
		end

		def add_transfer transfer
			self.transfers << transfer
		end
	end
end