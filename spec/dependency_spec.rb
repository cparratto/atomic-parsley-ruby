require "spec_helper"

module AtomicParsleyRuby
  describe Dependency do
     it "raises an exception when AtomicParsley in not in your path" do
      Dependency.stubs("which").with("AtomicParsley").returns("/usr/bin/AtomicParsley")
      Dependency.path.should eq "/usr/bin/AtomicParsley"
     end

     it "returns the path when AtomicParsley is in your path" do
       Dependency.stubs("which").with("AtomicParsley").returns(nil)
       expect {Dependency.path}.to raise_error(::AtomicParsleyRuby::Exception, "AtomicParsley is not in your path.")
     end
  end
end