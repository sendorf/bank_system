require 'spec_config'

describe BankSystem::Account do

  describe '.balance' do
    context 'Gives the balance of a given account' do
      it 'Gives back the balance of an account' do
        owner = BankSystem::Person.new("Jim")
        expect(BankSystem::Account.new(10000, owner).balance).to be 10000
      end
    end
    context 'Gives the balance of a given account' do
      it 'Gives back the balance of an account from an already created account' do
        account = BankSystem::Account.new(10000, BankSystem::Person.new("Emma"))
        expect(account.balance).to be 10000
      end
    end
  end

  describe '.owner' do
    context 'Gives the owner of a given account' do
      it 'Gives back the owner of an account' do
        owner = BankSystem::Person.new("Jim")
        expect(BankSystem::Account.new(10000, owner).owner.name).to eq "Jim"
      end
    end
    context 'Gives the owner of a given account' do
      it 'Gives back the owner of an account from an already created account' do
        account = BankSystem::Account.new(10000, BankSystem::Person.new("Emma"))
        expect(account.owner.name).to eq "Emma"
      end
    end
  end
end