module BankSystem
	class Agent

		def transfer sender, receiver, amount, banks
			pending = amount
			sender_totals = sender_totals sender, banks
			relevant_bank_index = sender_totals.index(sender_totals.sort.last)
			relevant_bank = banks[relevant_bank_index]
			receiver_banks = receiver_banks receiver, banks
			if receiver_banks[relevant_bank_index]
				receiver_account = relevant_bank.find_accounts_by_person(receiver).first
				receiver_account_index = relevant_bank.accounts.index(receiver_account)
				pending = take_from_same_bank relevant_bank, pending, sender, receiver, receiver_account
				if pending > 0
					sent = (amount - (take_from_differet_bank banks, receiver_account, pending, sender, receiver))
				else
					sent = amount
				end
				return sent
			else
				index = 0
				while (!receiver_banks[index] && index < receiver_banks[index].lenght)
					index +=1
				end
				receiver_account = banks[account]
				return (amount - (take_from_differet_bank banks, receiver_account, pending, sender, receiver))
			end
		end	

		private

		def sender_totals sender, banks
			sender_totals = []
			banks.each do |bank|
				total = 0
				bank.find_accounts_by_person(sender).each do |account|
					total += account.balance
				end
				sender_totals << total
			end
			return sender_totals
		end

		def receiver_banks receiver, banks
			receiver_banks = []
			banks.each do |bank|
				receiver_banks << !(bank.find_accounts_by_person(receiver).empty?)
			end
			return receiver_banks
		end

		def take_from_same_bank bank, pending, sender, receiver, receiver_account
			bank.find_accounts_by_person(sender).each do |account|
				if pending > 0
					if account.balance >= pending
						bank.make_transfer_with_accounts account, receiver_account, pending
						pending = 0
					else
						pending -= account.balance
						bank.make_transfer_with_accounts account, receiver_account, account.balance
					end
				end
			end
			return pending
		end

		def take_from_differet_bank banks, receiver_account, pending, sender, receiver
			index = 0
			while(pending > 0 && index < banks.length)
				bank = banks[index]
				bank.find_accounts_by_person(sender).each do |account|
					account_balance = account.balance
					while(account_balance > 5 && pending > 0)
						if (pending >=995 )
							result, acc = bank.make_transfer_with_accounts account, receiver_account, 1000
							if result
								pending -= 995
								account_balance -= 1000
							end
						elsif (pending <=995 )
							result, acc = bank.make_transfer_with_accounts account, receiver_account, (pending + 5)
							if result
								account_balance -= (pending + 5)
								pending = 0
							end
						else
							result, acc = bank.make_transfer_with_accounts account, receiver_account, account_balance
							if result
								pending -= (account_balance - 5)
								account_balance = 0
							end
						end
					end
				end
				index +=1
			end
			return pending
		end

	end
end