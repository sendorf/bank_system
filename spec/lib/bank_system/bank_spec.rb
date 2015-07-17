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
          account = BankSystem::Account.new(rand(10000))
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
          sender = BankSystem::Account.new(rand(10000))
          receiver = BankSystem::Account.new(rand(10000))
          amount = rand(sender.balance)
          transfer = BankSystem::Transfer.new(sender, receiver, amount)
          transfers << transfer
        end
        expect(subject.transfers).to eq transfers
      end
    end
  end
end