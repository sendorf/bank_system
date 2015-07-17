require 'spec_config'

describe BankSystem::InterBankTransfer do

  describe '.new' do
    context 'Creates a Transfer' do
      person = BankSystem::Person.new("Emma")
      person1 = BankSystem::Person.new("Jim")
      sender = BankSystem::Account.new(rand(1000), person)
      receiver = BankSystem::Account.new(rand(1000), person1)
      amount = rand(sender.balance)
      transfer = BankSystem::InterBankTransfer.new(sender, receiver, amount)

      it 'The transfer has a sender' do
        expect(transfer.sender).to eq sender
      end

      it 'The transfer has a receiver' do
        expect(transfer.receiver).to eq receiver
      end

      it 'The transfer has an amount' do
        expect(transfer.amount).to eq (amount -5)
      end

      it 'The transfer has a commision' do
        expect(transfer.commission).to eq 5.0
      end

      it 'Raises an error if the amount is greater than 1000' do
        expect{BankSystem::InterBankTransfer.new(sender, receiver, 2000)}.to raise_error(RuntimeError, "Error::NotAValidAmount")
      end
    end
  end
end