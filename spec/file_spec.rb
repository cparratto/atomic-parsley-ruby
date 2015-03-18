require "spec_helper"

module AtomicParsleyRuby
  RSpec.describe File do
    it "raises an error when an incorrect file name is passed" do
      expect {::AtomicParsleyRuby::File.valid?("test.txt")}.to raise_error(::AtomicParsleyRuby::Exception,"Invalid file type.")
    end

    it "does not raise an error for mp4s" do
      expect(::AtomicParsleyRuby::File.valid?("test.mp4")).to be true
    end

    its "does not raise an error for m4vs" do
      expect(::AtomicParsleyRuby::File.valid?("test.m4v")).to be true
    end

    its "does not raise an error for mp3s" do
      expect(::AtomicParsleyRuby::File.valid?("test.mp3")).to be true
    end
    
    it "does not raise an error for m4as" do
      expect(::AtomicParsleyRuby::File.valid?("test.m4a")).to be true
    end
    
  end
end