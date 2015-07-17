require 'spec_config'

describe BankSystem::Bank do

  describe '.accounts' do
    context 'Gives the list of accounts of a bank' do
      it 'The given list is empty' do
        expect(subject.accounts.empty?).to be true
      end

      it 'Gives back the account list' do
        expect(subject.accounts).to be []
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
end