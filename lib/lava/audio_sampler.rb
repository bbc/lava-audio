module Lava

  class AudioSampler

    SAMPLE_TIME=0.1
    DEFAULT_TMP_DIR = '/tmp/lava/audio/'

    attr_accessor :dir, :sox

    def initialize(args = {})
      @dir = args[:dir] || "#{DEFAULT_TMP_DIR}/#{Time.now.to_f}"
      @sox = args[:sox] || which_sox
      if !sox
        raise "It doesn't look like sox is installed. Install it to proceed!"
      end
      FileUtils.mkdir_p(@dir)
      File.directory?(@dir) or raise "Couldn't create session directory for screen grabs"
    end

    def volume
      ( analyze(sample) * 100 ).to_i
    end

    def sample 
      file = "#{dir}/#{Time.now.to_f}.wav"
      `rec #{file} trim 0 #{SAMPLE_TIME} 2>&1`
      file
    end

    def analyze(file)
      `#{sox} -t .wav #{file} -n stat 2>&1 | grep 'Maximum amplitude' | sed "s/[^0-9.]//g"`.to_f
    end
    
    def which_sox
      result = `which sox`.chop
      if $?.exitstatus == 0
        result
      else
        nil
      end
    end

  end

end
