require 'spec_config'

describe BankSystem::Account do

  describe '.balance' do
    context 'Gives the balance of a given account' do
      it 'Gives back the balance of an account' do
        expect(BankSystem::Account.new(10000).balance).to be 10000
      end
    end
    context 'Gives the balance of a given account' do
      it 'Gives back the balance of an account from an already created account' do
        account = BankSystem::Account.new(10000)
        expect(account.balance).to be 10000
      end
    end
  end
end