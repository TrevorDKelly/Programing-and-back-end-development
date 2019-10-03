# get int
# return int
# 
# set start date as jan 1, year
# find first friday
# iterate through every friday
#   if it is the 13
#     add 1 to count
# return count

require 'date'

def friday_13th(given_year)
  date = Date.new(given_year, 1, 1)
  date += 1 until date.friday?
  thirteens = 0
  until date.year != given_year
    thirteens += 1 if date.day == 13
    date += 7
  end
  thirteens
end

def friday_13th(given_year)
  date = Date.new(given_year, 1, 13)
  thirteens = 0
  12.times do
    thirteens += 1 if date.friday?
    date = date.next_month
  end
  thirteens
end

#five fridays
#
#set date
#initialize five_friday count
#iterate through all months
#  find first friday
#  iterate through fridays
#    if 5
#        add 1 to count
#return count

def count_fridays(date, month)
  date += 1 until date.friday?
  fridays = 0
  
  until date.month != month
    fridays += 1
    date += 7
  end
  
  fridays
end

def five_fridays(given_year)
  five_fridays = 0
  
  1.upto(12) do |month|
    date = Date.new(given_year, month, 1)
    
    five_fridays += 1 if count_fridays(date, month) == 5
  end
  
  five_fridays
end

p five_fridays(2010)
p five_fridays(2011)
p five_fridays(2012)
p five_fridays(2013)
p five_fridays(2014)