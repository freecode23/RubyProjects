require_relative '../warthog'

describe Warthog do
  describe '#initialize' do
    it 'should create instance of an warthog' do
      warthog = Warthog.new("scar")
      expect(warthog).to be_a(Warthog)
    end
  end
  describe '#talk' do
    it 'should return the roar of the warthog' do
      warthog = Warthog.new("scar")
      expect(warthog.talk).to eq("scar grunts")
    end
  end
end


