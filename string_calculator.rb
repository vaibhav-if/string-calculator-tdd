class StringCalculator
  def add(string_numbers)

    return 0 if string_numbers.empty?

    delimeter, string_numbers = custom_delimiter(string_numbers)

    # common delimeter if no custom one
    delimeter << "," if delimeter.empty?

    # handle new line between numbers
    string_numbers = string_numbers.gsub("\n", delimeter[0])

    sum = 0
    negative_numbers = []
    string_numbers_array = string_numbers.split(Regexp.union(delimeter))

    # iterate once for multiple conditions
    string_numbers_array.each do |c|
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

  private
  def custom_delimiter(string_numbers)
    delimeter = []
    begin_delimeter = false
    delimit = ""

    if string_numbers.start_with?("//")

      delimit_index = string_numbers.index("\n")

      delimit_part, string_numbers = string_numbers[2...delimit_index], string_numbers[delimit_index + 1..-1] if delimit_index

      if delimit_part && delimit_part.start_with?("[")
        delimit_part.each_char do |c|
          if c == "["
            begin_delimeter = true
            next
          end
          if c == "]" && begin_delimeter
            begin_delimeter = false
            delimeter << delimit
            delimit = ""
            next
          end
          delimit << c if begin_delimeter
        end
      else
        delimeter << delimit_part
      end
    end
    return delimeter, string_numbers
  end
end
