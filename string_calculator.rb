class StringCalculator
  def add(string_numbers)

    return 0 if string_numbers.empty?

    delimeter = ','
    delimeter = string_numbers[2] if string_numbers.start_with?("//") # custom delimeter

    string_numbers = string_numbers.gsub("\n", delimeter)

    integer_array = string_numbers.split(delimeter).map(&:to_i)

    negative_numbers = integer_array.select { |num| num < 0 }

    return "negative numbers not allowed " << negative_numbers.join(", ") unless negative_numbers.empty?

    return integer_array.sum
  end
end
