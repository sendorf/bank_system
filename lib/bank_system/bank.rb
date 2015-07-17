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

		def find_accounts_by_person person
			accounts = []
			@accounts.each do |account|
				(accounts << account) if account.owner == person
			end
		end
	end
end