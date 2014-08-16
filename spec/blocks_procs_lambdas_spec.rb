require 'blocks_procs_lambdas'

describe Array do

	let (:array) { [1, 2, 3, 4, 5] }

	context "map method" do

		it "fails if not called on an array" do
			string = String.new
			expect{ string.map }.to raise_error
		end

	end

end