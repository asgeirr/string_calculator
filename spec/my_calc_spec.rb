require_relative "../lib/my_calc"

describe MyCalc do
	describe "Adding numbers" do

			def make_calc
				MyCalc.new
			end

		context "over 1000" do

			it "returns zero" do
				result = make_calc.add(1001,1)
				result.should be 0
			end


			it "returns zero checking the second argument" do
				result = make_calc.add(1,1001)
				result.should be 0
			end
			
		end
	end
end