require 'spec_config'

describe BankSystem::Account do

  describe '.balance' do
    context 'Gives the balance of a given account' do
      it 'Gives back the balance of an account' do
        expect{ subject.new(10000).balance }.to 10000
      end
    end
  end
end