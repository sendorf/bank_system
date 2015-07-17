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

		def make_transfer_with_accounts account1, account2, amount
			return [false, nil] if (account1.balance < amount)
			index1 = self.accounts.index(account1)
			index2 = self.accounts.index(account2)
			if index2
				account1.balance -= amount
				account2.balance += amount
				accounts[index1] = account1
				accounts[index2] = account2
				add_transfer BankSystem::IntraBankTransfer.new(account1, account2, amount)
				return [true, nil]
			else
				return [false, nil] if (1000 < amount)
				error = rand
				puts "Error = " + error.to_s
				if error > 0.3
					account1.balance -= amount
					account2.balance += amount
					accounts[index1] = account1
					add_transfer BankSystem::InterBankTransfer.new(account1, account2, amount)
					return [true, account2]
				else 
					return [false, nil]
				end
			end
		end
	end
end