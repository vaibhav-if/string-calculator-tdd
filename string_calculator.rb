class StringCalculator
  def add(string_numbers)
    return 0 if string_numbers.empty?

    return string_numbers.split(",").map(&:to_i).sum
  end
end
