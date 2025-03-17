class StringCalculator
  def add(string_numbers)
    return 0 if string_numbers.empty?
    string_numbers = string_numbers.gsub("\n", ",")
    return string_numbers.split(",").map(&:to_i).sum
  end
end
