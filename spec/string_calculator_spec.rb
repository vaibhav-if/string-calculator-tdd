require "./string_calculator"

# Input: “”, Output: 0
# Input: “1”, Output: 1
# Input: “1,5”, Output: 6

RSpec.describe 'StringCalculator' do
  it 'returns 0 for empty string' do
    @string_calculator = StringCalculator.new
    expect(@string_calculator.add("")).to eq(0)
  end

  it 'adds two values in comma separated string' do
    @string_calculator = StringCalculator.new
    expect(@string_calculator.add("1,2")).to eq(3)
  end
end