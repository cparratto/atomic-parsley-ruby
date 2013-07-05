require "spec_helper"

module AtomicParsleyRuby
  describe File do
    it "raises an error when an incorrect file name is passed" do
      expect {::AtomicParsleyRuby::File.valid?("test.txt")}.to raise_error(::AtomicParsleyRuby::Exception,"Invalid file type.")
    end

    it "does not raise an error for mp4s" do
      ::AtomicParsleyRuby::File.valid?("test.mp4").should be_true
    end

    its "does not raise an error for m4vs" do
      ::AtomicParsleyRuby::File.valid?("test.m4v").should be_true
    end

    its "does not raise an error for mp3s" do
      ::AtomicParsleyRuby::File.valid?("test.mp3").should be_true
    end
  end
end