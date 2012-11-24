require 'spec_helper'

describe Googlon do
  context "constants" do
    it { Googlon::FOO.should == %w(z g v h b) }
    it { Googlon::BAR.should == %w(a c d e f i j k l m n o p q r s t u x y w) }
  end

  context "foobar" do
    it "its a foo letter" do
      Googlon::FOO.each do |letter|
        Googlon.foo?(letter).should be_true
      end
    end

    it "its a bar letter" do
      Googlon::BAR.each do |letter|
        Googlon.bar?(letter).should be_true
      end
    end
  end
end
