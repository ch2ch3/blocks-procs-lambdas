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

end