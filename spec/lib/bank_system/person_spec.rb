require 'spec_config'

describe BankSystem::Person do

  describe '.name' do
    context 'Gives the name of a given person' do
      it 'Gives back the name of an person' do
        expect(BankSystem::Person.new("Jim").name).to eq "Jim"
      end
    end
    context 'Gives the name of a given person' do
      it 'Gives back the name of person from an already created person' do
        person = BankSystem::Person.new("Emma")
        expect(person.name).to eq "Emma"
      end
    end
  end
end