class StringCalculator
  def add(string_numbers)
    return 0 if string_numbers.empty?
    delimeter = ','
    delimeter = string_numbers[2] if string_numbers.start_with?("//")
    string_numbers = string_numbers.gsub("\n", delimeter)
    return string_numbers.split(delimeter).map(&:to_i).sum
  end
end
