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

		it "can be used with a proc instead of a block" do
			my_proc = Proc.new { |x| x * x }
			expect(array.map(&my_proc)).to eq [1, 4, 9, 16, 25]
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
			output = []
			array.each { |x| output << x * x }
			expect(output).to eq [1, 4, 9, 16, 25]
		end

	end

	context "inject method" do

		it "can be used to join an array of strings" do
			array = ["This", "is", "a", "sentence"]
			expect(array.inject { |sentence, word| sentence << " " unless sentence.empty?; sentence << word }).to eq "This is a sentence"
		end


		it "can be used to sum an array of numbers" do
			expect(array.inject(:+)).to eq 15
		end

		it "can be used to get specific attributes from an array of hashes" do
			array = [{:name => "A", :age => 21}, {:name => "B", :age => 42}, {:name => "C", :age => 17}]
			expect(array.inject([]) { |memo, hash| memo << hash[:name] }).to eq ["A", "B", "C"]
		end

		it "can be used to combine an array of arrays" do
			array = [["Ginsberg", "Dylan", "Cunningham", "Cage"], ["Lenny Bruce", "Langston Hughes"], ["Uta", "Buddha", "Pablo Neruda"]]
			expect(array.inject("") { |string, array| string << ", " unless string.empty?; string << array.join(", ") }).to eq "Ginsberg, Dylan, Cunningham, Cage, Lenny Bruce, Langston Hughes, Uta, Buddha, Pablo Neruda"
		end

	end

end