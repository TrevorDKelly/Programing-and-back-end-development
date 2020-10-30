require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, occurance)
    case occurance
    when :first  then next_from(1, weekday)
    when :second then next_from(8, weekday)
    when :third  then next_from(15, weekday)
    when :fourth then next_from(22, weekday)
    when :teenth then next_from(13, weekday)
    else              find_last(weekday)
    end
  end

  private

  def next_from(day_number, weekday)
    date = Date.new(@year, @month, day_number)

    loop do
      break if date.send(weekday.to_s + '?')
      date += 1
    end

    date
  end

  def find_last(weekday)
    date = Date.new(@year, @month).next_month - 1

    date -= 1 until date.send(weekday.to_s + '?')

    date
  end
end

# day
#   have month, year
#   get day of week, occurance number
#   return Date
#
#   gather all *days(mondays) in that month
#     get first, label as first
#     add 7 days, mark as second
#     ...
#     for the one that is a teen, add teenth
#     add last to last one
#
#   methods for each occurance
#     first is first
#     second is first + 7
#       third, forth
#     teenth is cycle from 13th till day
#     last is cycle from end backwards
#
#     day method
#       case for occurance
#       if first
#         first(weekday)
#
# day
#   case for occurance
#   first then occ_number(1, weekday
#   second ....
#   last  then find_last(day
#   teent  ...
#
# occ number
#   get number, weekday
#
#   -6 + number * 7
#   day = date with month, year, number
#   add day until == weekday
#   return date
#
# last
#   get weekday
#
#   get last day of month
#     first day of next month - 1
#   subtract day until is weekday
#
# teenth
#   13 add 1 untill is weekday
