require 'spec_config'

describe BankSystem::IntraBankTransfer do

  describe '.new' do
    context 'Creates a Transfer' do
      person = BankSystem::Person.new("Emma")
      person1 = BankSystem::Person.new("Jim")
      sender = BankSystem::Account.new(rand(10000), person)
      receiver = BankSystem::Account.new(rand(10000), person1)
      amount = rand(sender.balance)
      transfer = BankSystem::IntraBankTransfer.new(sender, receiver, amount)

      it 'The transfer has a sender' do
        expect(transfer.sender).to eq sender
      end

      it 'The transfer has a receiver' do
        expect(transfer.receiver).to eq receiver
      end

      it 'The transfer has an amount' do
        expect(transfer.amount).to eq amount
      end

      it 'The transfer has a commision' do
        expect(transfer.commission).to eq 0.0
      end
    end
  end
end