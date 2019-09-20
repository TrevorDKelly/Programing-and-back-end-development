# 1 
  def short_long_short(str1, str2)
    if str1.size > str2.size
      new_string << str2 << str1 << str2
    else
      new_string << str1 << str2 << str1
    end
  end
  
# 2
  def century(year)
    century_number = ((year - 1) / 100) + 1
    
    add_ordinal(century_number)
  end
  
  def add_ordinal(num)
    if num.digits[1] == 1
      "#{num}th"
    else
      last = num.digits.first
      case last
      when 1 then "#{num}st"
      when 2 then "#{num}nd"
      when 3 then "#{num}rd"
      else        "#{num}th"
      end
    end
  end
  
# 3
  def leap_year?(year)
    year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
  end
  
  def leap_year_2?(year)
    if year % 4 == 0
      if year % 100 == 0
        year % 400 == 0 ? true : false
      else
        true
      end
    else
      false
    end
  end
  
# 4
  def leap_year?(year)
    if year < 1752
      year % 4 == 0
    else
      year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
    end
  end

# 5 
  # initiate array
  # loop through each number from 1 to num
  # add to array if % 3 = 0 OR % 5 = 0
  # find sum of array
  
  def multisum(num)
    (1..num).select { |x| x % 3 == 0 || x % 5 == 0 }.sum
  end
  
# 6
  def running_total(arr)
    x = 0
    arr.map { |num| x += num }
  end
  
  def running_total_2(arr)
    x = 0
    arr.each_with_object([]) { |num, new_arr| new_arr << (x += num) }
  end
  
  def running_total_3(arr)
    x = 0
    arr.inject([]) { |new_arr, num| new_arr << (x += num) }
  end
  
# 7
  # split string into each digit
  # convert digits to ints
  # put together
    # set multiplier to 1
    # pop last digit * multiliter
    # multiplier  * 10
  
  NUM_HASH = {
      '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
      '7' => 7, '8' => 8, '9' => 9, '0' => 0, 'a' => 10,
      'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
    }
  
  def string_to_integer(str, hex = false)
    base = hex ? 16 : 10
    arr = str.chars.map { |num| NUM_HASH[num.downcase] }
    integer = 0
    arr.each { |num| integer = integer * base + num }
    integer
  end

# 8
  def string_to_signed_integer(str)
    value = string_to_integer(str.delete('-' '+'))
    
    str[0] == '-' ? -value : value
  end

# 9
  def integer_to_string(int)
    int.digits.reverse.map { |num| NUM_HASH.key(num) }.join
  end
  
# 10
  def signed_integer_to_string(num)
    sign = case 
           when num > 0 
             '+'
           when num < 0
             num *= -1
             '-'
           else
             ''
           end
    
    sign + integer_to_string(num)
  end

  p signed_integer_to_string(4321) == '+4321'
  p signed_integer_to_string(-123) == '-123'
  p signed_integer_to_string(0) == '0'