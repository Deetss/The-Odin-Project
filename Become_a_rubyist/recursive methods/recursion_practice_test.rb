roman_mapping_to_i = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }


  roman_mapping_to_r = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
def integer_to_roman(roman_mapping, number, result = "")
    return result if number == 0
    roman_mapping.keys.each do
        |divisor|
        quotient, modulus = number.divmod(divisor)
        result << roman_mapping[divisor] * quotient
        return integer_to_roman(roman_mapping,modulus, result) if quotient > 0
    end
end
def roman_to_integer(roman_mapping, input, result = 0)
    return result if input.empty?
    roman_mapping.keys.each do
        |numeral|
        if input.start_with?(numeral)
            result += roman_mapping[numeral]
            input = input.slice(numeral.length, input.length)
            return roman_to_integer(roman_mapping, input, result)
        end
    end
end
p integer_to_roman(roman_mapping_to_i, 11)
p roman_to_integer(roman_mapping_to_r, "CMXVI")

# >> "XI"
# >> 916