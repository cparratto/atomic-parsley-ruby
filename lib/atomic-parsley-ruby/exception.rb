module AtomicParsleyRuby
  class Exception < StandardError
    def initialize(msg = "AtomicParsleyException: Generic Exception Msg.")
      super(msg)
    end
  end
end