require "./string_calculator"

# Input: “”, Output: 0
# Input: “1”, Output: 1
# Input: “1,5”, Output: 6

RSpec.describe 'StringCalculator' do
  let(:string_calculator) { StringCalculator.new }

  it 'returns 0 for empty string' do
    expect(string_calculator.add("")).to eq(0)
  end

  context 'adds multiple values in comma separated string' do
    it 'adds two values in comma separated string' do
      expect(string_calculator.add("1,2")).to eq(3)
    end

    it 'adds three values in comma separated string' do
      expect(string_calculator.add("1,2,3")).to eq(6)
    end
  end

  it 'handle new lines between numbers' do
    expect(string_calculator.add("1\n2,3")).to eq(6)
  end

  context 'supports different delimeters' do
    it 'adds two values in custom delimeter string' do
      expect(string_calculator.add("//;\n1;2")).to eq(3)
    end

    it 'adds multiple values in custom delimeter string' do
      expect(string_calculator.add("//:\n1:2:3")).to eq(6)
    end

    it 'adds multiple values in custom delimeter string of any length' do
      expect(string_calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'allows multiple delimeters' do
      expect(string_calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'allows multiple delimeters of any length' do
      expect(string_calculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
    end
  end

  context 'negative numbers should throw an exception' do
    it 'if there is a negative number then throw an exception' do
      expect(string_calculator.add("-1,2")).to eq("negative numbers not allowed -1")
    end

    it 'if there are multiple negative numbers then include them in exception message' do
      expect(string_calculator.add("-1,-2")).to eq("negative numbers not allowed -1, -2")
    end
  end

  it "should ignore numbers bigger than 1000" do
    expect(string_calculator.add("1001,2")).to eq(2)
  end
end