class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = scrub(number)
  end

  def area_code
    number[0..2]
  end

  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  def scrub(number)
    number.gsub!(/[(). \-]/, '')
    number.gsub!(/1(.{10})/, '\1')

    number =~ /^\d{10}\z/ ? number : '0000000000'
  end
end

# questions
#   area code and to_s for invalid
#   special chars
#     only - . ()
#


# scrub
#   get string
#   return string
#
#   always return 10 digits
#   all 0s if invalid number
#     any non numbers
#     must be 10 digits or 11 digits without a 1 to start
#
#   validate
#     all numbers, or () - .
#     10 or 11 digits
#     starts with 1 if 11
#
#     remove ()-.' '
#     remove 1 at start if 11 size
#     return all 0s unless
#       all numbers and 10 digits
#     return nubmer
