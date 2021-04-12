require_relative '../meerkat'

describe Meerkat do
  describe '#initialize' do
    it 'should create instance of an meerkat' do
      meerkat = Meerkat.new("scar")
      expect(meerkat).to be_a(Meerkat)
    end
  end
  describe '#talk' do
    it 'should return the roar of the meerkat' do
      meerkat = Meerkat.new("scar")
      expect(meerkat.talk).to eq("scar barks")
    end
  end
end


