require 'spec_config'

describe BankSystem::Bank do

  describe '.accounts' do
    context 'Gives the list of accounts of a bank' do
      it 'The given list is empty' do
        expect(subject.accounts.empty?).to be true
      end

      it 'Gives back the account list' do
        expect(subject.accounts).to eq []
      end

      it 'Gives back the list of accounts already introduced in the bank' do
        accounts = []
        4.times do
          person = BankSystem::Person.new("Emma")
          account = BankSystem::Account.new(rand(10000), person)
          subject.add_account account
          accounts << account
        end
        expect(subject.accounts).to eq accounts
      end
    end
  end

  describe '.transfers' do
    context 'Gives the list of transfers of a bank' do
      it 'The given list is empty' do
        expect(subject.transfers.empty?).to be true
      end

      it 'Gives back the transfers list' do
        expect(subject.transfers).to eq []
      end

      it 'Gives back the list of transfers already introduced in the bank' do
        transfers = []
        4.times do
          person = BankSystem::Person.new("Emma")
          person1 = BankSystem::Person.new("Jim")
          sender = BankSystem::Account.new(rand(10000), person)
          receiver = BankSystem::Account.new(rand(10000), person1)
          amount = rand(sender.balance)
          transfer = BankSystem::Transfer.new(sender, receiver, amount)
          subject.add_transfer transfer
          transfers << transfer
        end
        expect(subject.transfers).to eq transfers
      end
    end
  end

  describe '.find_accounts_by_person' do
    context 'Gives the list of accounts of a user in a bank' do
      user = BankSystem::Person.new("Jim")
      it 'if the given user has not accounts in the bank' do
        expect(subject.find_accounts_by_person(user).empty?).to be true
      end

      it 'if the list is empty' do
        expect(subject.find_accounts_by_person(user)).to eq []
      end

      it 'Gives back the list of accounts of the user already introduced in the bank' do
        accounts = []
        4.times do
          account = BankSystem::Account.new(rand(10000), user)
          subject.add_account account
          accounts << account
        end
        expect(subject.find_accounts_by_person(user)).to eq account
      end
    end
  end
end