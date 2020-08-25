module RomanNumeralConvertable
  ROMAN_NUMERAL_CONVERSIONS = {
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }

  def to_roman
    num = self
    roman_numeral = ''

    ROMAN_NUMERAL_CONVERSIONS.each do |amount, letters|
      while num >= amount
        roman_numeral << letters
        num -= amount
      end
    end

    roman_numeral
  end
end

Integer.class_eval do
  include RomanNumeralConvertable
end

