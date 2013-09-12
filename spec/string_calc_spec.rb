require_relative '../lib/string_calc'
require 'bogus/rspec'

describe "String calculator" do
	describe "Adding" do

		def adding (string)
			calc.add(string)
		end

		subject(:calc) {StringCalculator.new(:logger)}
		let(:logger) { fake(:slow_logger)}

		context "empty string" do
			specify {adding("").should == 0}
		end

		context "one number" do
			specify {adding("1").should == 1}
			specify {adding("2").should == 2}
		end

		context "two numbers" do
			specify {adding("1,2").should == 3}
			specify {adding("2,3").should == 5}
			specify {adding("1,10").should == 11}
			specify {adding("10,11").should == 21}
		end

		context "more than two numbers" do
			specify {adding("1,2,3").should == 6}
		end

		context "logging" do
			before {adding("1,2")}
			subject {logger}
			it {should have_received.write "got 3"}
		end

	end
end
