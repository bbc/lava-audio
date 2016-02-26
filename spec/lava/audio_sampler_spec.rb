require 'lava/audio_sampler'

RSpec.describe Lava::AudioSampler do
  
  let(:tmp_dir) { "/tmp/lava/spec/#{rand(10000)}" }
  
  describe ".initialize" do
    it "creates a lava audio sampler object" do
      expect( Lava::AudioSampler.new ).to be_a Lava::AudioSampler
    end
    
    it "creates the capture directory" do
      Lava::AudioSampler.new(dir: tmp_dir)
      
      expect( File.directory? tmp_dir ).to be true
    end
    
  end
  
  describe "#volume" do
    
    let(:sampler) { Lava::AudioSampler.new(dir: tmp_dir) }
    
    it "performs the sample and returns a volume value" do
      expect( sampler.volume ).to be_a Fixnum
    end
  
  end
  
end
