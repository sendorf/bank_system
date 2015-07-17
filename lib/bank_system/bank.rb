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
			return accounts
		end

		def make_transfer_with_accounts account1, account2, amount
			return [false, nil] if (account1.balance < amount)
			index1 = self.accounts.index(account1)
			index2 = self.accounts.index(account2)
			if index2
				account1.balance -= amount
				account2.balance += amount
				self.accounts[index1].balance = account1.balance
				self.accounts[index2].balance = account2.balance
				add_transfer BankSystem::IntraBankTransfer.new(account1, account2, amount)
				return [true, nil]
			else
				return [false, nil] if (1000 < amount)
				error = rand
				puts "Error = " + error.to_s
				if error > 0.3
					account1.balance -= amount
					account2.balance += (amount - 5)
					self.accounts[index1].balance = account1.balance
					add_transfer BankSystem::InterBankTransfer.new(account1, account2, amount)
					return [true, account2]
				else 
					return [false, nil]
				end
			end
		end
	end
end