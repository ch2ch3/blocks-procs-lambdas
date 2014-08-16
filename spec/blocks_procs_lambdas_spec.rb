require 'blocks_procs_lambdas'

describe Array do

	let (:array) { [1, 2, 3, 4, 5] }

	context "map method" do

		it "fails if not called on an array" do
			expect{ String.new.map }.to raise_error
		end

		it "returns an array if a block is passed" do
			expect(array.map { |x| x }.class).to eq Array
		end

		it "returns an enumerator if no block is passed" do
			expect(array.map.class).to eq Enumerator
		end

		it "invokes the given block once for each element" do
			expect(array.map{ |x| x + 10 }).to eq [11, 12, 13, 14, 15]
		end

	end

	context "select method" do

		it "fails if not called on an array" do
			expect{ String.new.select }.to raise_error
		end

		it "returns an array if a block is passed" do
			expect(array.select { |x| x }.class).to eq Array
		end

		it "returns an enumerator if no block is passed" do
			expect(array.select.class).to eq Enumerator
		end

		it "selects elements for which the block returns true" do
			expect(array.select { |x| x.odd? }).to eq [1, 3, 5]
		end

	end

	context "each method" do

		it "fails if called on a string" do
			string = String.new
			expect{ string.each }.to raise_error
		end

		it "can be called on a hash" do
			expect{ Hash.new.each }.not_to raise_error
		end

		it "returns an enumerator if no block is passed" do
			expect(array.each.class).to eq Enumerator
		end

		it "calls the given block once for each element" do
			output_each = []
			output_for = []
			array.each { |x| output_each << x * x }
			for x in array do output_for << x * x end
			expect(output_each).to eq output_for
		end

	end

end