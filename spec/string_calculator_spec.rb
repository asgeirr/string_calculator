require_relative '../lib/string_calculator.rb'
require "bogus/rspec"

describe "String calculator" do
	describe "Adding" do
		def adding(input)
			calc.add(input)
		end

		subject(:calc) {StringCalculator.new(fake_logger)}
		let(:fake_logger) { fake(:logger)}

		context "Empty string" do
			specify {adding("").should == 0}
		end

		context "Single number" do
			specify {adding("1").should == 1}
			specify {adding("2").should == 2}
		end

		context "More than one number" do
			specify {adding("1,2").should == 3}
			specify {adding("1,2,3").should == 6}
		end

		context "Other delimiters" do
			specify {adding("1\n2").should == 3}
			specify {adding("1\n2,3").should == 6}
			specify {adding("//;\n1;2").should == 3}
		end

		context "Reject negative numbers" do
			specify {expect {adding("1,-2")}.to raise_error}
		end

		context "Numbers larger than 1000 should be ignored" do
			specify {adding("2,1001").should == 2}
		end

		context "Save result to logger" do
			before {adding("1,2")}
			subject {fake_logger}
			it {should have_received.write("got 3")}
		end

	end
end