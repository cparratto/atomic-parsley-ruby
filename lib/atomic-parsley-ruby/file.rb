module AtomicParsleyRuby
  module File
    def self.valid?(fn)
      if ![".m4v", ".mp4", ".mp3", ".m4a"].include?(::File.extname(fn))
        raise ::AtomicParsleyRuby::Exception, "Invalid file type."
      end
      true
    end
  end
end