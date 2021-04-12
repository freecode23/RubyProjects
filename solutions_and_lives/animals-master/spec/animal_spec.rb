require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'should create instance of an animal' do
      animal = Animal.new("scar")
      expect(animal).to be_an(Animal)
    end
  end
  describe '#name' do
    it 'should return the name of the animal' do
      animal = Animal.new("scar")
      expect(animal.name).to eq("scar")
    end
  end
end


