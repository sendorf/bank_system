require 'spec_config'

describe BankSystem::Agent do

  describe '.transfer' do
    context 'Transfers an amount between 2 people' do
      person = BankSystem::Person.new("Emma")
      person1 = BankSystem::Person.new("Jim")
      bank = BankSystem::Bank.new
      bank1 = BankSystem::Bank.new


      it 'Enough money in one account in the same bank' do
        bank.add_account BankSystem::Account.new(15000, person1)
        bank1.add_account BankSystem::Account.new(20000, person1)
        bank.add_account BankSystem::Account.new(0, person)
        bank1.add_account BankSystem::Account.new(0, person)
        subject.transfer person, person1, 20000
        expect(bank1.find_accounts_by_person(person1).first.balance).to eq 0
        expect(bank1.find_accounts_by_person(person).first.balance).to eq 20000
      end

      it 'Not enough money in one account in the same bank' do
        bank.add_account BankSystem::Account.new(15000, person1)
        bank1.add_account BankSystem::Account.new(10000, person1)
        bank.add_account BankSystem::Account.new(0, person)
        bank1.add_account BankSystem::Account.new(0, person)
        transfered_amount = subject.transfer person, person1, 20000
        expect(bank.find_accounts_by_person(person1).first.balance).to eq 0
        expect(bank1.find_accounts_by_person(person1).first.balance).to eq 5000
        expect(bank.find_accounts_by_person(person).first.balance).to eq 20000
      end

      it 'Not enough money in all accounts' do
        bank.add_account BankSystem::Account.new(15000, person1)
        bank1.add_account BankSystem::Account.new(3000, person1)
        bank.add_account BankSystem::Account.new(0, person)
        bank1.add_account BankSystem::Account.new(0, person)
        transfered_amount = subject.transfer person, person1, 20000
        expect(bank.find_accounts_by_person(person1).first.balance).to eq 0
        expect(bank1.find_accounts_by_person(person1).first.balance).to eq 0
        expect(bank.find_accounts_by_person(person).first.balance).to eq transfered_amount
      end
    end
  end
end