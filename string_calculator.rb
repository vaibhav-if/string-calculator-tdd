class StringCalculator
  def add(string_numbers)

    return 0 if string_numbers.empty?

    delimeter = ','
    delimeter = string_numbers[2] if string_numbers.start_with?("//") # custom delimeter

    string_numbers = string_numbers.gsub("\n", delimeter)

    sum = 0
    negative_numbers = []
    # iterate once for multiple conditions
    string_numbers.split(delimeter).each do |c|
      num = c.to_i
      if num < 0
        negative_numbers << num
      elsif num <= 1000
        sum += num
      end
    end

    return "negative numbers not allowed " << negative_numbers.join(", ") unless negative_numbers.empty?

    return sum
  end
end
