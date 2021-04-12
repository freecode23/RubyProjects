require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'should create instance of an lion' do
      lion = Lion.new("scar")
      expect(lion).to be_an(Lion)
    end
  end
  describe '#talk' do
    it 'should return the roar of the lion' do
      lion = Lion.new("scar")
      expect(lion.talk).to eq("scar roars")
    end
  end
end


