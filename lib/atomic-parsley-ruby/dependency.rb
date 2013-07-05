module AtomicParsleyRuby
  module Dependency
    def self.path
      p = Dependency.which('AtomicParsley')
      if p.nil?
        raise ::AtomicParsleyRuby::Exception, "AtomicParsley is not in your path."
      end
      p
    end

    private

    def self.which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(::File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = ::File.join(path, "#{cmd}#{ext}")
          return exe if ::File.executable? exe
        }
      end
      return nil
    end
  end
end