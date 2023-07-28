require_relative '../src/master_mind.rb'

describe MasterMind do

  describe "#master mind" do
    it "It detect well placed color" do
      master_mind = MasterMind.new('RG')

      expect(master_mind.guess("RB")).to eq([1,0])
    end
    it "It detect miss placed color" do
      master_mind = MasterMind.new('RG')

      expect(master_mind.guess("RR")).to eq([1,0])
    end
    it "It detect miss placed color when single color is repeated" do
      master_mind = MasterMind.new('RGRGBB')

      expect(master_mind.guess("RRGGAA")).to eq([2,2])
    end
  end

end